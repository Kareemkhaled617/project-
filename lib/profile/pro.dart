import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:p/listpro.dart';

import '../main.dart';
import '../password.dart';
import 'edit_image.dart';
import 'edit_name.dart';
import 'edit_phone.dart';

class pro extends StatelessWidget {
  const pro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(5, 100, 5, 100),
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map data = snapshot.data as Map;
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            data['userprofile'] != null
                                ? ClipOval(
                                    child: Image.network(
                                      data['userprofile']['profile_pic'],
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : CircleAvatar(
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/p1.jpg',
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditImage(
                                            name: data['username'],
                                            mobile: data['userprofile']
                                                ['mobile'],
                                            email: data['email'],
                                            image: data['userprofile']
                                                ['profile_pic'],
                                          )),
                                );
                              },
                              icon: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.camera,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 4.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Personal Information",
                                  style: TextStyle(
                                    color: Colors.blue.shade500,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          ...ListTile.divideTiles(
                                            color: Colors.grey,
                                            tiles: [
                                              ListTile(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 4),
                                                leading:
                                                    const Icon(Icons.person),
                                                title: const Text(
                                                  "name",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle:
                                                    Text(data['username']),
                                                trailing: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditName(
                                                                name: data[
                                                                    'username'],
                                                                mobile: data[
                                                                        'userprofile']
                                                                    ['mobile'],
                                                                email: data[
                                                                    'email'],
                                                                image: data[
                                                                        'userprofile']
                                                                    [
                                                                    'profile_pic'],
                                                              )),
                                                    );
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                leading:
                                                    const Icon(Icons.email),
                                                title: const Text(
                                                  "email",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(data['email']),
                                                // trailing: IconButton(
                                                //   onPressed: () {
                                                //     Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //           builder: (context) => edit(
                                                //             name: data['username'],
                                                //             mobile: data['userprofile']
                                                //             ['mobile'],
                                                //             email: data['email'],
                                                //             image: data['userprofile']
                                                //             ['profile_pic'],
                                                //           )),
                                                //     );
                                                //   },
                                                //   icon: const Icon(
                                                //     Icons.edit,
                                                //     color: Colors.blue,
                                                //   ),
                                                // ),
                                              ),
                                              ListTile(
                                                leading: const Icon(
                                                    Icons.phone_android),
                                                title: const Text(
                                                  "phone",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                    data['userprofile']
                                                        ['mobile']),
                                                trailing: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditPhone(
                                                                name: data[
                                                                    'username'],
                                                                mobile: data[
                                                                        'userprofile']
                                                                    ['mobile'],
                                                                email: data[
                                                                    'email'],
                                                                image: data[
                                                                        'userprofile']
                                                                    [
                                                                    'profile_pic'],
                                                              )),
                                                    );
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                leading: const Icon(
                                                    Icons.password_rounded),
                                                title: const Text(
                                                  "Change Password",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                trailing: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              password()),
                                                    );
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Container(
                              //   height: (40.0),
                              //   width: (145.0),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(15),
                              //     color: Colors.blue.shade400,
                              //   ),
                              //   child: MaterialButton(
                              //     onPressed: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => edit(
                              //                   name: data['username'],
                              //                   mobile: data['userprofile']
                              //                       ['mobile'],
                              //                   email: data['email'],
                              //                   image: data['userprofile']
                              //                       ['profile_pic'],
                              //                 )),
                              //       );
                              //     },
                              //     child: const Text(
                              //       'Edit Profile',
                              //       style: TextStyle(
                              //           color: Colors.white,
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 15),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
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
