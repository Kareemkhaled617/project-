import 'package:flutter/material.dart';
import 'package:p/cam.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:p/listpro.dart';
class DisplayPhoto extends StatelessWidget {
  const DisplayPhoto({
    Key? key,
    required this.image,
  }) : super(key: key);
  final XFile image;
  @override
  Widget build(BuildContext context) => Scaffold(
  drawer: listpro(),
  appBar:AppBar (backgroundColor: Colors.blue.shade300,centerTitle: true,),
    backgroundColor:Colors.white ,
    body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 50,),
          Stack(

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(File(image!.path),
                  height: 450,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
              alignment: Alignment.center,

              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical:10.0 ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade200,
                ),
                child:Text("Disease Name", style:TextStyle(fontSize: 18.0),),
              )
          ),

        ],
      ),
    ),
  );


}