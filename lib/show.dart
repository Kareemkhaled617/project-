import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:p/cam.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:p/listpro.dart';

import 'main.dart';

class DisplayPhoto extends StatefulWidget {
  const DisplayPhoto({
    Key? key,
    required this.image,
  }) : super(key: key);
  final XFile image;

  @override
  State<DisplayPhoto> createState() => _DisplayPhotoState();
}

class _DisplayPhotoState extends State<DisplayPhoto> {
  String result = 'No Data';

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: listpro(),
        appBar: AppBar(
          backgroundColor: Colors.blue.shade300,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(widget.image.path),
                      height: 450,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await predict(image: File(widget.image.path));
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade200,
                    ),
                    child: const Text(
                      "Disease Name",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Result : ',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),),
                  Text(result,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 18),),
                ],
              ),
            ],
          ),
        ),
      );

  Future predict({
    required File image,
  }) async {
    var request = MultipartRequest(
      'POST',
      Uri.parse('https://172-105-248-224.ip.linodeusercontent.com/predict/'),
    );

    // Add headers to the request
    request.headers['content-type'] = 'Multiple/form-data';
    request.headers['Authorization'] =
        'token ${sharedPreferences.getString('token')}' ?? '';

    // Add fields to the request
    // request.fields['username'] = username;

    // Add image file to the request
    var imageField = await MultipartFile.fromPath(
      'image',
      image.path,
    );
    request.files.add(imageField);

    var streamedResponse = await request.send();
    var response = await Response.fromStream(streamedResponse);
    var data = json.decode(response.body);
     result = data['Disease'];
    print(data);

    // if (data['message'] == 'User registered successfully') {
    //   // Handle successful registration
    // }

    return result;
  }
}
