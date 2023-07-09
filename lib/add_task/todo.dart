import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:p/add_task/todoitem.dart';
import 'package:p/add_task/todolist.dart';
import 'package:p/listpro.dart';
import 'package:p/main.dart';

class todo extends StatefulWidget {
  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  final list1 = ToDo.list1();
  final _todoCotronller = TextEditingController();
  List<ToDo> _foundToDo = [];

  @override
  void iniState() {
    _foundToDo = list1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(sharedPreferences.getString('token'));
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      drawer: listpro(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        // title: Text('Your Todo List'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          searchBox(),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: FutureBuilder(
            future: getTsk(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List data = snapshot.data as List;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) => todoitem(
                          todo: data[index],
                        ));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _todoCotronller,
                    decoration: const InputDecoration(
                      hintText: 'Add a new ToDo item',
                      border: InputBorder.none,
                    ),
                  ),
                )),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // _addToDoItem(_todoCotronller.text);
                      addTsk(task: _todoCotronller.text);
                      _todoCotronller.clear();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future addTsk({required String task}) async {
    var res = await post(
        Uri.parse('https://172-105-248-224.ip.linodeusercontent.com/tasks/'),
        headers: {
          "Authorization": 'token ${sharedPreferences.getString('token')}' ?? ''
        },
        body: {
          'title': task,
        });
    var data = json.decode(res.body);
    return data;
  }

  Future getTsk() async {
    var res = await get(
      Uri.parse('https://172-105-248-224.ip.linodeusercontent.com/tasks/'),
      headers: {
        "Authorization": 'token ${sharedPreferences.getString('token')}' ?? ''
      },
    );
    var data = json.decode(res.body);
    return data;
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = list1;
    } else {
      results = list1
          .where((item) => item.todotext!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, size: 20),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
        ),
      ),
    );
  }
}
