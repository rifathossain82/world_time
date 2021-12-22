import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time_demo/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


void getWorld_time() async{
  World_time instance=World_time('Dhaka', 'Asia/Dhaka', 'Dhaka.png', '',true);
  await instance.getData();
  print(instance.time);
  setState(() {
    Navigator.pushReplacementNamed(context, '/',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  });
}

  @override
  void initState() {
    super.initState();
    getWorld_time();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
