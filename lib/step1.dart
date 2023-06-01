import 'package:flutter/material.dart';
import 'package:p/listpro.dart';
import 'package:p/step2.dart';
class step1 extends StatefulWidget {
  const step1({Key? key}) : super(key: key);
  @override
  State<step1> createState() => _step1State();
}
class _step1State extends State<step1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(backgroundColor: Colors.blue.shade300,centerTitle: true,),
      body: Padding(
        padding: (EdgeInsets.all(50.0)),
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [Column(
                children: [
                  Text('Step 1',
                    style:TextStyle(decoration: TextDecoration.underline,color: Colors.blue.shade500,fontWeight: FontWeight.w900,fontSize:(25.0),letterSpacing: 1.0
                    ),),
                  SizedBox(height: 40,),
                  Image.asset('images/2.PNG'),
                  SizedBox(height: 50,),

                  Text(
                    'Take a photo',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                    color: Colors.blueGrey,
                  ),),

                  SizedBox(height: 5,),
                  Text(
                    'and capture the infected area',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,
                    color: Colors.blueGrey,
                  ),),
                ],),
                SizedBox(
                  height: 50.0,),
                Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade300,),

                    child:MaterialButton
                      (onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>  step2()),);}
                      ,
                      child: Text('Next',
                        style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:(20.0),letterSpacing: 1.0
                        ),),)
                )
                ,],),),),
      ),
    );}}
