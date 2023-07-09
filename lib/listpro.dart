import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:p/All.dart';
import 'package:p/feedback.dart';
import 'package:p/history_list.dart';
import 'package:p/profile/pro.dart';
import 'package:p/screens/diseases_list.dart';
import 'package:p/screens/governatlist.dart';
import 'package:p/step1.dart';

import 'add_task/todo.dart';
import 'login.dart';
import 'main.dart';

class listpro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map data = snapshot.data as Map;
                  return UserAccountsDrawerHeader(
                    accountName: Text(data['username']),
                    accountEmail: Text(data['email']),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          data['userprofile']['profile_pic'],
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        "images/R.jpg",
                      ),
                      fit: BoxFit.cover,
                    )),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => All()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('ِAdd'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => todo()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_sharp),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pro()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HistoryListScreen()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.health_and_safety_outlined),
            title: const Text('Healthcare'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiseasesListScreen()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.question_mark_rounded),
            title: const Text('Help Center'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GovernateListScreen()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.note_alt_outlined),
            title: const Text('My Notes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => All()),
              );
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.front_hand_outlined),
            title: const Text('How to use'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const step1()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.feedback_outlined),
            title: const Text('Feedback'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => feedback()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () {
              logOut().then((value) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => login()));
              });
            },
          )
        ],
      ),
    );
  }

  Future logOut() async {
    var response = await put(
        Uri.parse('https://172-105-248-224.ip.linodeusercontent.com/logout/'),
        headers: {
          "Authorization": 'token ${sharedPreferences.getString('token')}' ?? ''
        },
        body: {
          'token': sharedPreferences.getString('token')
        });

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      print("Error");
      print(response.body);
    }
  }

  getData() async {
    var response = await get(
        Uri.parse(
            'https://172-105-248-224.ip.linodeusercontent.com/updateprofile/'),
        headers: {
          'content-type': 'Multiple/form-data',
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
