import 'dart:ffi';
//import 'package:app1/all.dart';
import 'package:p/All.dart';
import 'package:p/home.dart';
import 'package:p/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'cam.dart';

class login extends StatelessWidget {
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color:Colors.blue.shade300,

                    ),
                  ),),
                SizedBox(
                  height: 20.0,),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value)
                  {
                    print(value);
                  },
                  onChanged: (String value){
                    print(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,),
                    labelText: 'Email Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)

                    ),

                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
                      return "Enter your Email";
                    }
                    return null;
                  },

                ),
                SizedBox(
                  height: 15.0,),
                SizedBox(width: 500,
                  child:
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
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)

                      ),

                    ),
                    validator: (value){

                      if(value!.isEmpty){
                        return "Set a Password";
                      }
                      else if(value!.length<7){
                        return"too short Password";
                      }

                      return null;
                    },

                  ),),
                SizedBox(
                  height: 20.0,),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.shade300,),
                    child:MaterialButton
                      (onPressed:(){
                      if(formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                        Navigator.push(context,MaterialPageRoute(builder:(context)=> All()),);
                      }
                    },
                      child:  Text('Login', style:TextStyle(color: Colors.white,),),)

                ),

                SizedBox(
                  height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>  register()),
                      );
                    }, child: Text('Register Now',),)
                  ],
                )
              ],
            ),
          ),), ),
    );
  }
}
