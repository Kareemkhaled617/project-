import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:p/listpro.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

// import 'package:navigator_in_listview/model/disease.dart';
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.id, required this.title});

  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: FutureBuilder(
        future: getDoctor(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map data = snapshot.data as Map;
            return ListView.builder(
              itemCount: data['doctors'].length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const CircleAvatar(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.white,
                                radius: 35,
                                backgroundImage: AssetImage("images/doc.png")),
                            const SizedBox(width: 5.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data['doctors'][index]['dr_name'],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      data['doctors'][index]['dr_adress'],
                                      style: TextStyle(
                                          color: Colors.blue.shade200,
                                          fontSize: 17.0),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final Uri url = Uri(
                                    scheme: 'tel',
                                    path: data['doctors'][index]
                                        ['dr_phone_number']);
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  print('Cannot call');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue.shade200,
                              ),
                              icon: const Icon(Icons.call),
                              label: const Text(
                                "Call",
                                style: TextStyle(fontSize: 18.0),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  getDoctor(String id) async {
    var response = await get(
        Uri.parse('https://172-105-248-224.ip.linodeusercontent.com/city/$id'),
        headers: {
          "Authorization": 'token ${sharedPreferences.getString('token')}' ?? ''
        });

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      print("Error");
    }
  }
}
