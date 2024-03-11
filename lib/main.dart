import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:labs_online/AdminLabs/Admin.dart';
import 'package:labs_online/LoginUser/Login.dart';
import 'package:labs_online/LoginUser/register.dart';
import 'package:labs_online/firebaseAuth.dart';
import 'package:labs_online/skip.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyCbw2AOKUq4JfVoZceQsZP27aCa6Q2z2-U",
              appId: "1:474247137471:android:474f58b5863b60faf3de0a",
              messagingSenderId: "474247137471",
              projectId: "final-project-b67b9"))
      // WidgetsFlutterBinding.ensureInitialized();
      // SystemChrome.setPreferredOrientations(
      //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      : await Firebase.initializeApp();

  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;

  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _getUser();
    return 
MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(brightness: Brightness.light),
            title: 'Flutter Demo',
            initialRoute: '/',
            //
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              '/': (context) => Skip(),
              '/login': (context) => FireBaseAuth(),

              '/SignIn': (context) => SignIn(),
              '/Admin': (context) => Admin(),
            });
  }
}
