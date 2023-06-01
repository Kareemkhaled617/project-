import 'package:p/listpro.dart';
import 'package:p/All.dart';
import 'package:p/pro.dart';
import 'package:p/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class password extends StatelessWidget {
  var passwordController= TextEditingController();
  var passwordControllerNew= TextEditingController();

  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(backgroundColor: Colors.blue.shade300,centerTitle: true,),
      body: Form(
        key: formkey,
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Align(
                  alignment:
                  Alignment.center,
                  child:Text(
                    'Change My Password',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color:Colors.blue.shade300,
                      letterSpacing: .1

                    ),
                  ),),
                SizedBox(
                  height: 40.0,),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted: (String value)
                  {
                    print(value);
                  },
                  onChanged: (String value){
                    print(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,),
                    labelText: 'Current Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Your Password";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.0,),
                SizedBox(width: 500,
                  child:
                  TextFormField(
                    controller: passwordControllerNew,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value)
                    {
                      print(value);
                    },
                    onChanged: (String value){
                      print(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock,),
                      labelText: 'New Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Set Your New Password";
                      }
                      else if(value!.length<7){
                        return"too short Password";
                      }

                      return null;
                    },
                  ),),
                SizedBox(
                  height: 25.0,),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.shade300,),
                    child:MaterialButton
                      (onPressed:(){
                      if(formkey.currentState!.validate()) {
                        print(passwordController.text);
                        Navigator.push(context,MaterialPageRoute(builder:(context)=> pro()),);
                      }
                    },
                      child:  Text('Save', style:TextStyle(color: Colors.white,fontSize: 20),),)
                ),
                SizedBox(
                  height: 15.0,),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.shade300,),
                    child:MaterialButton
                      (onPressed:(){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=> pro()),);
                      },
                      child:  Text('Cancel', style:TextStyle(color: Colors.white,fontSize: 20),),)
                ),
              ],
            ),
          ),), ),
    );
  }
}