import 'dart:ffi';
//import 'package:app1/login.dart';
//import 'package:app1/editpro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p/login.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Padding(
        padding: (EdgeInsets.all(30.0)),
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [Column(
                children: [
                  Image.asset('images/IMG_9984.PNG',),
                  SizedBox(
                    height:00.0,),
                  Text(
                    'Skin Scanner',style: TextStyle(color: Colors.blueGrey,fontStyle:FontStyle.italic
                    ,fontWeight:FontWeight.bold,letterSpacing: 10.0,fontSize:25,),),],),
                SizedBox(
                  height: 110.0,),
                Container(
                    height: 55.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade900,),

                    child:MaterialButton
                      (onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>  login()),);}
                      ,
                      child: Text('Start Now',
                        style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:(20.0),letterSpacing: 3.0
                        ),),)                  ),],),),), ),);}}
