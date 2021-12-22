import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:world_time_demo/pages/choose_location.dart';
import 'package:world_time_demo/services/world_time.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Map data={};


  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;

    String bg_image=data['isDayTime']? 'day.png':'night.png';
    Color? color_=data['isDayTime']? Colors.blue:Colors.indigo[700];

    return Scaffold(
      backgroundColor: color_,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bg_image'),
              fit: BoxFit.cover
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result=await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location,color: Colors.grey[300],),
                  label: Text('Edit Location',style: TextStyle(color: Colors.grey[300]),),
                ),
                SizedBox(height: 20,),
                Text(data['location'],style: TextStyle(fontSize: 28,letterSpacing: 2,color: Colors.white),),
                SizedBox(height: 20,),
                Text(data['time'],style: TextStyle(fontSize: 66,color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
