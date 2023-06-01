import 'package:p/listpro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p/edit.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class feedback extends StatelessWidget {
  final msgcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: listpro(),
      appBar: AppBar(backgroundColor: Colors.blue.shade300,centerTitle: true,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Column(
            children:[
              SizedBox(height: 200,),
             Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
                child:Text('Tell Us How We Can Improve',
                  style: TextStyle(color:Colors.yellow.shade800,fontSize: 18.0,fontWeight: FontWeight.bold),)
            ),SizedBox(height:10 ,),
              Row(
                children: [
                  Expanded(
                child:  Container(
                    margin: EdgeInsets.symmetric(horizontal:20),
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                    ),
                    child: TextField(
                      controller: msgcontroller,
                      style:const TextStyle(color: Colors.black,fontSize: 15
                      ),
                      maxLines: 10,
                      decoration:const InputDecoration(
                        hintText: ' Write Here...'
                      ),

                    ),
                  ),)
                ],
              ),
              SizedBox(height:50 ,),
          const    Center(
                child: Text('How Would You Rate Our App?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
              ),
              SizedBox(height:30 ,),
              Center(
                child:RatingBar.builder(
                  initialRating:3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding:const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) =>const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),

              SizedBox(height:50 ,),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.shade300,
                ),
                child: MaterialButton(
                  onPressed: (){},
                  child: const Text('Send Now',style: TextStyle(letterSpacing: 1,color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }}