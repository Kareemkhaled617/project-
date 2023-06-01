import 'package:flutter/material.dart';
import 'package:p/model/disease.dart';
import 'package:p/screens/details.dart';
import 'package:p/listpro.dart';
class DiseasesListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        drawer: listpro(),
        appBar: AppBar(backgroundColor: Colors.blue.shade300,centerTitle: true,
          title: Text('Skin Diseases'),),

        body: ListView.builder(

            itemCount: diseasesList.length,
            itemBuilder: (context, index){
              Disease disease = diseasesList[index];
              return
                Card(
                child:ListTile(
                  title: Text(disease.title),
                  leading: Image.asset(disease.imgurl),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(disease) ));

                  },

                  /*IconButton(
                icon:Icon(Icons.arrow_forward_ios_rounded),
                 onPressed: (){
                  Navigator.push(context,MaterialPageRoute(
                      builder:(context) => Disease()));
                 },
                 )*/
                ),
              );
            }
        )
    );
  }
}