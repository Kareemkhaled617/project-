import 'package:flutter/material.dart';
import 'package:p/animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoAnimated(),
    );
  }
}
