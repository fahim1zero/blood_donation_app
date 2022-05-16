// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:ui';
import 'package:blood_donation_app/components.dart';
import 'package:blood_donation_app/home_page.dart';
import 'package:blood_donation_app/requestForm.dart';
import 'package:blood_donation_app/selfDonationForm.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      theme: ThemeData(
        primaryColor: lPrimaryColor,
        appBarTheme: AppBarTheme(
          color: lPrimaryColor,
          centerTitle: true,
        ),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
