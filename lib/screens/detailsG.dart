import 'package:flutter/material.dart';
import 'package:flutter/src/painting/rounded_rectangle_border.dart';
import 'package:p/listpro.dart';
import 'package:p/model/governate.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:navigator_in_listview/model/disease.dart';
class DetailsPage extends StatelessWidget {
  final Governate governate;
  DetailsPage(this.governate);
  List name =["dr/Alaa Ahmed","dr/Eslam Mohamed","dr/Osama Ahmed"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(
        title: Text(governate.title),centerTitle: true,backgroundColor: Colors.blue.shade300,
      ),
      body: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical:7.0 ),
          child: Card(
            elevation: 5,
            shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9)
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical:10.0 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            foregroundColor:Colors.white,
                            radius: 35,
                            backgroundImage: AssetImage("images/doc.png")
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name[index],style: TextStyle(color: Colors.black,
                              fontSize:18.0, fontWeight: FontWeight.bold ),
                          ),
                          TextButton(
                              onPressed: (){},
                              child: Text("Address", style: TextStyle(color: Colors.blue.shade200,fontSize:17.0 ),))
                        ],
                      ),

                    ],
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical:10.0 ),
                      child: ElevatedButton.icon(
                        onPressed: () async{
                          final Uri url = Uri(
                              scheme: 'tel',
                              path: "01002943927"
                          );
                          if (await canLaunchUrl(url)){
                            await launchUrl(url);
                          }else{
                            print('Cannot call');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade200,

                        ),

                        icon: Icon(
                            Icons.call),
                        label: Text("Call", style:TextStyle(fontSize: 18.0),),
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
