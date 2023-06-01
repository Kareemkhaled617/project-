import 'package:flutter/material.dart';
import 'package:p/listpro.dart';

class HistoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),

      appBar: AppBar(backgroundColor: Colors.blue.shade300, centerTitle: true,
        title: const Text("Your History"),
      ),
      body: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) =>
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  elevation: 5,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.asset("images/ecz1.jpg",
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month_outlined),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("11/4/2023", style: TextStyle(
                                    color: Colors.black54, fontSize: 15.0)
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.accessibility_new_outlined),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Eczema", style: TextStyle(
                                    color: Colors.black54, fontSize: 15.0)
                                ),
                              ],
                            ),
                          ],

                        ),
                      )
                    ],
                  )
              ),
            ),
      ),
    );
  }
}
