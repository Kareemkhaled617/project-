import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:p/add_task/todo.dart';

import '../main.dart';

class todoitem extends StatefulWidget {
  final todo;

  const todoitem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<todoitem> createState() => _todoitemState();
}

class _todoitemState extends State<todoitem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          updateTsk(
              value: widget.todo['completed'] == true ? 'no' : 'yes',
              id: widget.todo['id']);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => todo()));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        textColor: Colors.white,
        leading: Icon(
          widget.todo['completed']
              ? Icons.check_box
              : Icons.check_box_outline_blank,
          color: Colors.blue.shade300,
        ),
        title: Text(
          widget.todo['title'],
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration:
                widget.todo['completed'] ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              deleteTsk(id: widget.todo['id']);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => todo()));
            },
          ),
        ),
      ),
    );
  }

  Future updateTsk({required String value, required int id}) async {
    var res = await patch(
        Uri.parse(
            'https://172-105-248-224.ip.linodeusercontent.com/tasks/$id/'),
        headers: {
          "Authorization": 'token ${sharedPreferences.getString('token')}' ?? ''
        },
        body: {
          'completed': value,
        });
    var data = json.decode(res.body);
    return data;
  }

  Future deleteTsk({required int id}) async {
    var res = await delete(
      Uri.parse('https://172-105-248-224.ip.linodeusercontent.com/tasks/$id/'),
      headers: {
        "Authorization": 'token ${sharedPreferences.getString('token')}' ?? ''
      },
    );
  }
}
