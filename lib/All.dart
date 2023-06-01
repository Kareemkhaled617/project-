import 'dart:ffi';
import 'package:p/all.dart';
import 'package:p/history_list.dart';
import 'package:p/home.dart';
import 'package:p/cam.dart';
import 'package:p/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p/listpro.dart';
import 'package:p/screens/diseases_list.dart';
class All extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar:AppBar (backgroundColor: Colors.blue.shade300,centerTitle: true,),
      body: Padding(
        padding: (EdgeInsets.all(35.0)),
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [Column(
                children: [
                  Image.asset('images/logo1.png',),
                ],
              ),
                SizedBox(
                  height: 50.0,),
                Container(
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.blue.shade200,),

                    child:MaterialButton
                      (onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>  LandingScreen()),);}
                      ,
                      child: Text('Detect Your Skin',
                        style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:(20.0),letterSpacing: 2.0
                        ),),)                  ),
                SizedBox(height:30,),
                Container(
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.blue.shade200,),

                    child:MaterialButton
                      (onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>  HistoryListScreen()),);}
                      ,
                      child: Text('History',
                        style:TextStyle(color: Colors.white,fontSize:(20.0),letterSpacing: 1.0
                        ),),)                  ),
                SizedBox(height: 30,),
                Container(
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.blue.shade200,),

                    child:MaterialButton
                      (onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>  DiseasesListScreen()),);}
                      ,
                      child: Text('Healthcare',
                        style:TextStyle(color: Colors.white,fontSize:(20.0),letterSpacing: 1.0
                        ),),)                  ),
              ],),),), ),);}}
