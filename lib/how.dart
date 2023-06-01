import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p/cam.dart';
import 'package:p/listpro.dart';
class how extends StatefulWidget {
  const how({Key? key}) : super(key: key);
  @override
  State<how> createState() => _howState();
}
class _howState extends State<how> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(backgroundColor: Colors.blue.shade300,centerTitle: true,),
      body: Padding(
        padding: (EdgeInsets.all(30.0)),
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 50.0,
                      width: 600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.blueGrey,),

                      child:MaterialButton
                        (onPressed:(){ }
                        ,
                        child: Text('How to take photo',
                          style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:(20.0),letterSpacing: 1.0
                          ),),)
                  ),
                  SizedBox(height: 10,),
                  Image.asset('images/New1.png'),
                  SizedBox(height: 10,),

                  Text(
                    'Points to remember while taking photo',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,
                    color: Colors.blueGrey,
                  ),),
                  SizedBox(height: 15,),

                  Text(
                    '1-  Hold your phone steady',textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,fontSize:16
                  ),),
                  SizedBox(
                    height: 10.0,),
                  Text(
                    '2- Position it 10-15 cms away from target',style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,fontSize:16
                  ),),
                  SizedBox(
                    height: 10.0,),
                  Text(
                    '3- Ensure good lighting',style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,fontSize:16
                  ),),
                  SizedBox(
                    height: 10.0,),
                  Text(
                    '4- Ensure target area is well focused at center of screen',style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize:16,
                    color: Colors.blueGrey,
                  ),)
                ],),
                SizedBox(
                  height: 30.0,),
                Container(
                    height: 55.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade300,),

                    child:MaterialButton
                      (onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>  LandingScreen()),);}
                      ,
                      child: Text('Start taking photo',
                        style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:(20.0),letterSpacing: 1.0
                        ),),)
                )
                ,],),),),
      ),
    );}}
