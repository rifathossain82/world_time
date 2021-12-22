import 'package:flutter/material.dart';
import 'package:world_time_demo/pages/Home.dart';
import 'package:world_time_demo/pages/choose_location.dart';
import 'package:world_time_demo/pages/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loading',
      routes: {
        '/':(context)=>Home(),
        '/location':(context)=>Location(),
        '/loading':(context)=>Loading(),
      },
    );
  }
}
