import 'package:flutter/material.dart';
import 'package:untitled2/login.dart';
import 'package:untitled2/register.dart';
import 'package:untitled2/details.dart';
import 'package:untitled2/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled2/commerce.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'home': (context) => BiogasifyApp(),
      'login': (context) => MyLogin(),
      'details': (context) => UserDetailsApp(),
      'commerce': (context) => ECommerceApp(),
    },
  ));
}
