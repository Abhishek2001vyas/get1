// import 'package:flutter/material.dart';
// import 'package:get1/home.dart';
// import 'package:get/get.dart';
//
// import 'home2.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//
//       home: Home2(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get1/api/firebase_api.dart';
import 'package:get1/home3.dart';
import 'package:get1/view/home3.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home2.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HOme3(),
    );
  }
}