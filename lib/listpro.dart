import 'package:p/All.dart';
import 'package:p/feedback.dart';
import 'package:p/history_list.dart';
import 'package:p/home.dart';
import 'package:p/pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:p/screens/diseases_list.dart';
import 'package:flutter/material.dart';
import 'package:p/screens/governatlist.dart';
import 'package:p/step1.dart';
class listpro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text('nehal emad'),
            accountEmail: Text('nehalemad@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "images/p1.jpg", width: 90, height: 90, fit: BoxFit.cover,),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/R.jpg",
                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => All()),);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle_sharp),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => pro()),);
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => HistoryListScreen()),);
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.health_and_safety_outlined),
            title: Text('Healthcare'),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DiseasesListScreen()),);
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.question_mark_rounded),
            title: Text('Help Center'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => GovernateListScreen()),);
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.note_alt_outlined),
            title: Text('My Notes'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => All()),);
            },
          ),
          Divider(),

          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.front_hand_outlined),
            title: Text('How to use'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => step1()),);
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.feedback_outlined),
            title: Text('Feedback'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => feedback()),);
            },
          ),

          SizedBox(height: 10,),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => home()),);
            },
          )
        ],
      ),
    );
  }
}