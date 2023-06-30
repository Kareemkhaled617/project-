import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p/listpro.dart';
import 'package:p/password.dart';
import 'package:p/profile/pro.dart';

import '../main.dart';

class EditImage extends StatefulWidget {
  const EditImage({
    Key? Key,
    required this.name,
    required this.mobile,
    required this.email,
    required this.image,
  }) : super(key: Key);

  final String name;
  final String mobile;
  final String email;
  final String image;

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  File? imageFile;
  final picker = ImagePicker();

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Column(
                      children: const [
                        Text(
                          'Change profile image',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.image,
                          color: Colors.blue,
                        ),
                        Text(
                          'Gallary',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      _imgFromGallary();
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: Column(
                      children: const [
                        Icon(
                          Icons.camera,
                          color: Colors.blue,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

  _imgFromGallary() async {
    await picker
        .pickImage(
      source: ImageSource.gallery,
    )
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _imgFromCamera() async {
    await picker
        .pickImage(
      source: ImageSource.camera,
    )
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Crop",
              toolbarColor: Colors.blue.shade200,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
      });
    }
  }

  late TextEditingController emailController;
  late TextEditingController nameController;

  late TextEditingController phoneController;

  @override
  void initState() {
    print(widget.email);
    print(widget.name);
    print(widget.mobile);
    emailController = TextEditingController(text: widget.email);
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.mobile);
    super.initState();
  }

  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: listpro(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    imageFile == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(
                              widget.image,
                              height: 150,
                              width: 150,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.file(
                              imageFile!,
                              height: 200,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.blue.shade300,
                          ),
                          child: IconButton(
                            onPressed: () {
                              _showChoiceDialog(context);
                            },
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.shade300,
                ),
                child: MaterialButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      updateProfile(
                              username: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              image: imageFile!)
                          .then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const pro()),
                        );
                      });
                    }
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Future updateProfile({
    required String username,
    required String email,
    required String phone,
    required File image,
  }) async {
    var request = MultipartRequest(
      'PATCH',
      Uri.parse(
          'https://172-105-248-224.ip.linodeusercontent.com/updateprofile/'),
    );

    // Add fields to the request
    // request.fields['username'] = username;
    // request.fields['email'] = email;
    // request.fields['userprofile.mobile'] = phone;
    request.headers['content-type'] = 'Multiple/form-data';
    request.headers['Authorization'] =
        'token ${sharedPreferences.getString('token')}' ?? '';

    // Add image file to the request
    var imageField = await MultipartFile.fromPath(
      'userprofile.profile_pic',
      image.path,
    );
    request.files.add(imageField);

    var streamedResponse = await request.send();
    var response = await Response.fromStream(streamedResponse);
    var data = json.decode(response.body);
    print(data);
    return data;
  }
}
