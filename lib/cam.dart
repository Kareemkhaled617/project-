import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p/Show.dart';
import 'package:p/listpro.dart';

void main() {
  runApp(const MaterialApp(
    title: "camera app",
    home: LandingScreen(),
  ));
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  File? image;
  final imagepicker = ImagePicker();

  camera() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile == null) return;
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => DisplayPhoto(image: pickedFile)));
  }

  gallary() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) return;
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => DisplayPhoto(image: pickedFile)));
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Column(
                      children: const [
                        Text(
                          'Choose One',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w900,
                              fontSize: 13),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.image,
                          color: Colors.blue,
                        ),
                        Text(
                          'Gallary',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                    onTap: () {
                      gallary();
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      children: const [
                        Icon(
                          Icons.camera,
                          color: Colors.blue,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      camera();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(backgroundColor: Colors.blue.shade300, centerTitle: true),
      body: Container(
        child: Center(
          child: Column(children: <Widget>[
            const SizedBox(
              height: 240,
            ),
            Image.asset(
              'images/png.png',
              width: 170,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 60.0,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade200,
                ),
                child: MaterialButton(
                  onPressed: () {
                    _showChoiceDialog(context);
                  },
                  child: const Text(
                    'Scanning',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: (23.0),
                        letterSpacing: 1.0),
                  ),
                ))
          ]),
        ),
      ),

      /*body: Column(
        children: <Widget>[
          SizedBox(height: 240,),
          Image.asset('images/png.png',width: 170,),
          SizedBox(height: 30,),
          Container(
            height: 60.0,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade200,),

              child:MaterialButton
                (onPressed:(){
                _showChoiceDialog(context);},
                child: const Text('Scanning',
                  style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:(23.0),
                      letterSpacing: 1.0
                  ),
                ),
              ),
          ),
          image == null ? Text('Select Image to display') :
          Image.file(image!)
        ],
      ),*/
    );
  }
}
