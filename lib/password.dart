import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:p/listpro.dart';
import 'package:p/profile/pro.dart';

import 'main.dart';

class password extends StatelessWidget {
  var passwordController = TextEditingController();
  var passwordControllerNew = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Change My Password',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade300,
                        letterSpacing: .1),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    labelText: 'Current Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Password";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: 500,
                  child: TextFormField(
                    controller: passwordControllerNew,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      labelText: 'New Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Set Your New Password";
                      } else if (value!.length < 7) {
                        return "too short Password";
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.shade300,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          updatePassword().then((value) {
                            if (value['status'] == 'success') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => pro()),
                              );
                            }
                          });
                        }
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.shade300,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pro()),
                        );
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future updatePassword() async {
    var response = await put(
        Uri.parse(
            'https://172-105-248-224.ip.linodeusercontent.com/ChangePassword/'),
        headers: {
          "Authorization": 'token ${sharedPreferences.getString('token')}' ?? ''
        },
        body: {
          'old_password': passwordController.text,
          'new_password': passwordControllerNew.text,
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
}
