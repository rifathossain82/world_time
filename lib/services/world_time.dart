import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:http/http.dart';

class World_time{
  String location;
  String time;
  String url;
  String flag;
  bool isDayTime;

  World_time(this.location, this.url, this.flag,this.time,this.isDayTime);


  Future<void> getData() async{
    try{
      Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data=jsonDecode(response.body);

      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);

      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset)));

      isDayTime=now.hour>6 && now.hour<20? true:false;
      time=DateFormat.jm().format(now);
    }
    catch(e){
      time="Could not find the time";
    }
  }


}