import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';
import 'package:p/listpro.dart';

import 'main.dart';

class feedback extends StatelessWidget {
  final msgController = TextEditingController();
  double rate = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: listpro(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Tell Us How We Can Improve',
                    style: TextStyle(
                        color: Colors.yellow.shade800,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      ),
                      child: TextField(
                        controller: msgController,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        maxLines: 10,
                        decoration:
                            const InputDecoration(hintText: ' Write Here...'),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  'How Would You Rate Our App?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    rate = rating;
                    print(rating);
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.shade300,
                ),
                child: MaterialButton(
                  onPressed: () {
                    feedBack(
                            message: msgController.text, stars: rate.toString())
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    'Send Now',
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future feedBack({
    required String message,
    required String stars,
  }) async {
    var response = await post(
      Uri.parse('https://172-105-248-224.ip.linodeusercontent.com/feedback/'),
      headers: {
        // 'Content-Type': 'multipart/form-data',
        'Authorization': 'token ${sharedPreferences.getString('token')}',
      },
      body: {
        'message': message,
        'stars': stars,
        'token': 'token ${sharedPreferences.getString('token')}',
      },
    );

    var data = json.decode(response.body);
    return data;
  }
}
