// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calcit/constants/AppTheme.dart';
import 'package:flutter/material.dart';

import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    appTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CalcIt",
      themeMode: appTheme.themeMode,
      darkTheme: darkTheme,
      theme: lightTheme,
      home: HomePage(),
    );
  }
}
