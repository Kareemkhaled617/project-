import 'package:flutter/material.dart';
import 'package:p/listpro.dart';
import 'package:p/model/governate.dart';
import 'package:p/screens/detailsG.dart';

class GovernateListScreen extends StatelessWidget {
  const GovernateListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: listpro(),
        appBar: AppBar(
          backgroundColor: Colors.blue.shade300,
          centerTitle: true,
          title: const Text('Egypt states'),
        ),
        body: ListView.builder(
            itemCount: governateList.length,
            itemBuilder: (context, index) {
              Governate governate = governateList[index];
              return Card(
                child: ListTile(
                  title: Text(governate.title),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  id: '${index + 1}',
                                  title: governate.title,
                                )));
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
            }));
  }
}
