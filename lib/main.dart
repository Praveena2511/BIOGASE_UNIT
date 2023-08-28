import 'package:flutter/material.dart';
import 'package:untitled2/login.dart';
import 'package:untitled2/logo.dart';
import 'package:untitled2/register.dart';
import 'package:untitled2/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled2/productlist.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage(),
  ));
}
