import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:p/listpro.dart';
import 'package:p/main.dart';

class HistoryListScreen extends StatelessWidget {
  const HistoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),

      appBar: AppBar(backgroundColor: Colors.blue.shade300, centerTitle: true,
        title: const Text("Your History"),
      ),
      body: FutureBuilder(
        future:hisData() ,
        builder: (context,snapshot) {
          if(snapshot.hasData){
            List data =snapshot.data as List;
            return ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        elevation: 5,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                  'https://172-105-248-224.ip.linodeusercontent.com${data[index]['image']}',
                                    height: 250,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_month_outlined),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                       Text(data[index]['date']??'1/11/1111', style: const TextStyle(
                                          color: Colors.black54, fontSize: 15.0)
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.accessibility_new_outlined),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(data[index]['prediction']??'enzimia',
                                          maxLines: 3,
                                          style: const TextStyle(
                                          color: Colors.black54, fontSize: 15.0)
                                      ),
                                    ],
                                  ),
                                ],

                              ),
                            )
                          ],
                        )
                    ),
                  ),
            );

          }else{
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }

  Future hisData() async {
    var url = Uri.parse('https://172-105-248-224.ip.linodeusercontent.com/predict/');

    var headers = {
      'Content-Type': 'Multiple/form-data',
      'Authorization': 'token ${sharedPreferences.getString('token')}',
    };

    var response = await get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      return data;
    } else {
      print('Error: ${response.statusCode}');
      return null;
    }
  }
}
