import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:p/listpro.dart';
import 'package:p/model/disease.dart';
import 'package:flutter/src/painting/rounded_rectangle_border.dart';
// import 'package:navigator_in_listview/model/disease.dart';

class DetailsPage extends StatelessWidget {
  final Disease disease;

  DetailsPage(this.disease);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(
        title: Text(disease.title),backgroundColor: Colors.blue.shade300,centerTitle: true,
      ),
      body:ListView(children: [
        SizedBox(height: 50,),

        Image.asset(disease.imgurl,
          height: 120,),
        SizedBox(height: 20,),
        Card(
          margin: const EdgeInsets.only(top: 10,left:50,right: 50, bottom: 10),
          clipBehavior: Clip.antiAlias,
          shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ) ,
          shadowColor: Colors.black,
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.white38],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: const Text('What you need to know ?',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ) ,
          shadowColor: Colors.black,
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Text(disease.description,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(top: 10,left:85,right: 85,bottom: 10),
          clipBehavior: Clip.antiAlias,
          shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ) ,
          shadowColor: Colors.black,
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.white38],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: const Text('How to Prevent it ?',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ) ,
          shadowColor: Colors.black,
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Text(disease.prevent,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(top: 10,left:50,right: 50,bottom: 10),
          clipBehavior: Clip.antiAlias,
          shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ) ,
          shadowColor: Colors.black,
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.white38],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: const Text('Risk Factors be aware of',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ) ,
          shadowColor: Colors.black,
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Text(disease.RiskFactors,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),

      ] ),
    );
  }

}
