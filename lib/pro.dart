import 'package:p/listpro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p/edit.dart';
class pro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(backgroundColor: Colors.blue.shade300,centerTitle: true,),
      body: SingleChildScrollView(
        child:Stack(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding:EdgeInsets.fromLTRB(5, 100, 5,100) ,
              child: Column(
                children: [
                  Container(


          child: ClipOval(
            child: Image.asset(
              "images/p1.jpg", width: 150, height: 150, fit: BoxFit.cover,),
          ),
        ),



                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 8.0,bottom: 4.0),
                          alignment: Alignment.center,
                          child: Text("Personal Information",
                            style: TextStyle(color: Colors.blue.shade500,fontWeight: FontWeight.bold,fontSize: 16,),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 3,),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),

                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children:<Widget> [
                                Column(
                                  children:<Widget> [
                                    ...ListTile.divideTiles(color:Colors.grey,
                                      tiles: [
                                        ListTile (contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12,vertical: 4),
                                          leading: Icon(Icons.person),
                                          title: Text("name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                          subtitle: Text('nehal emad'),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                          subtitle: Text("nehalemad21@gmail.com"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone_android),
                                          title: Text("phone",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                          subtitle: Text("01121337007"),
                                        ),
                                      ],),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height:(40.0) ,
                          width:(145.0),
                          decoration: BoxDecoration(


                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue.shade400,

                          ),
                          child:MaterialButton
                            (onPressed:(){
                            Navigator.push(context,MaterialPageRoute(builder:(context)=> edit()),);
                          },
                            child: Text('Edit Profile', style:
                            TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize:15),
                            ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),),
          ],),
      ),
    );

  }}