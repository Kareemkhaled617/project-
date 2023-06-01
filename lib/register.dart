import 'package:flutter/material.dart';
import 'package:editable_image/editable_image.dart';
import 'package:p/All.dart';
import 'package:p/password.dart';
import 'package:p/pro.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:p/listpro.dart';
class register extends StatefulWidget {
  const register({
    Key? Key,
  }) :super (key: Key);
  @override
  State<register> createState() => _registerState();
}
class _registerState extends State<register> {
  File? imageFile;
  final picker = ImagePicker();
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child:Column(
                      children: const[
                        Text('Choose a profile picture',style: TextStyle(color: Colors.blueGrey,fontWeight:
                        FontWeight.bold,fontSize: 15),),
                        SizedBox(height: 25,),
                        Icon(Icons.image,color: Colors.blue,) ,
                        Text('Gallary',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    onTap: () {
                      _imgFromGallary();
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    child:Column(
                      children: const[
                        Icon(Icons.camera,color: Colors.blue,) ,
                        Text('Camera',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  _imgFromGallary() async{
    await picker.pickImage(source: ImageSource.gallery,
    ).then((value){
      if(value != null){
        _cropImage(File(value.path));
      }
    }
    );
  }

  _imgFromCamera() async{
    await picker.pickImage(source: ImageSource.camera,
    ).then((value){
      if(value != null){
        _cropImage(File(value.path));
      }
    }
    );
  }

  _cropImage(File imgFile) async{
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ] : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [AndroidUiSettings(
            toolbarTitle: "Crop",
            toolbarColor: Colors.blue.shade200,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null){
      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
      });
    }
  }


  TextEditingController textController=TextEditingController();
  void iniState(){
    super.initState();
  }
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var nameController= TextEditingController();
  var phoneController= TextEditingController();
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
              Center(
                child: Stack(
                  children: [
                    const SizedBox(height: 20.0,),
                    imageFile == null
                        ?ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child:Image.asset('images/p1.jpg',height: 150,width: 150,),
                    )
                        :ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.file(imageFile!,height: 200,width: 200,
                        fit: BoxFit.fill,),
                    ),

                    Positioned(
                      bottom: 0, right: 0,
                      child: Container(
                          height: 50, width: 50, decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Theme
                            .of(context)
                            .scaffoldBackgroundColor,),
                        color: Colors.blue.shade300,
                      ),
                          child: IconButton(onPressed: () {
                            _showChoiceDialog(context);
                          },
                            icon: Icon(Icons.camera_alt_outlined,
                              color: Colors.white,),)
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),

              SizedBox(height: 30,),

                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (String value)
                    {
                      print(value);
                    },
                    onChanged: (String value){
                      print(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,),
                      labelText: 'Full name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                        return "Enter correct Name";
                      }
                      return null;
                    },

                  ),
                  SizedBox(
                      height: 15.0),
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
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)
                      ),

                    ),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
                        return "Enter correct Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                      height: 15.0),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (String value)
                    {
                      print(value);
                    },
                    onChanged: (String value){
                      print(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android,),
                      labelText: 'Phone',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)
                      ),

                    ),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value!)){
                        return "Enter correct Phone";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,),
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
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      prefixIcon: Icon(Icons.lock,),
                      labelText: 'Set a Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                    validator: (value){

                      if(value!.isEmpty){
                        return "Set a Password";
                      }
                      else if(value!.length<10){
                        return"too short Password";
                      }

                      return null;
                    },                ),
                  SizedBox(
                    height: 20.0,),
                  Container(
                    height:(50.0) ,
                    width:double.infinity,

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.shade300,

                    ),
                    child:MaterialButton
                      (onPressed:(){
                      if(formkey.currentState!.validate()){
                        print(nameController.text);
                        print(emailController.text);
                        print(passwordController.text);
                        print(phoneController.text);
                        Navigator.push(context,MaterialPageRoute(builder:(context)=> All()),);

                      }
                    },
                      child: Text('Submit', style: TextStyle(color: Colors.white,fontWeight:FontWeight.w400,fontSize:20),
                      ),
                    ),),],)
          ),
        ),),
    );
  }
}