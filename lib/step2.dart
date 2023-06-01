import 'package:flutter/material.dart';
import 'package:p/listpro.dart';
import 'package:p/how.dart';
class step2 extends StatefulWidget {
  const step2({Key? key}) : super(key: key);
  @override
  State<step2> createState() => _step2State();
}
class _step2State extends State<step2> {

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
                  Text('Step 2',
                    style:TextStyle(decoration: TextDecoration.underline,color: Colors.blue.shade500,fontWeight: FontWeight.w900,fontSize:(25.0),letterSpacing: 1.0
                    ),),
                  SizedBox(height: 40,),
                  Image.asset('images/Last.png'),
                  SizedBox(height: 50,),
                  Text(
                    'Predict skin infection',textAlign: TextAlign.center,style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                    color: Colors.blueGrey,
                  ),),

                  SizedBox(height: 5,),
                  Text(
                    'for further treatment',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,
                    color: Colors.blueGrey,
                  ),),
                  SizedBox(height: 5,),
                  Text(
                    'and preventative measures',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,
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
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>  how()),);}
                      ,
                      child: Text('Next',
                        style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:(20.0),letterSpacing: 1.0
                        ),),)
                )
                ,],),),),
      ),
    );}}
