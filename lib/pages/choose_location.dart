
import 'package:flutter/material.dart';
import 'package:world_time_demo/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}



class _LocationState extends State<Location> {

  List<World_time> locations = [
    World_time('Dhaka','Asia/Dhaka','bd2.png','',true),
    World_time('Kuala Lumpur','Asia/Kuala_Lumpur','ml.png','',true),
    World_time('Karachi','Asia/Karachi','pk.png','',true),
    World_time('London','Europe/London','uk.png','',true),
    World_time('Athens','Europe/Berlin',  'greece.png','',true),
    World_time('Cairo','Africa/Cairo', 'egypt.png','',true),
    World_time( 'Nairobi','Africa/Nairobi', 'kenya.png','',true),
    World_time('Chicago', 'America/Chicago', 'usa.png','',true),
    World_time('New York','America/New_York',  'usa.png','',true),
    World_time( 'Seoul','Asia/Seoul', 'south_korea.png','',true),
    World_time('Jakarta','Asia/Jakarta', 'indonesia.png','',true),
  ];



  void updateIndex(index) async{
    World_time instance=locations[index];
    await instance.getData();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }


  @override
  Widget build(BuildContext context) {
    print('build text');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                   updateIndex(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/${locations[index].flag}',),
                  ),
                ),
              ),
            );
          }
      )
    );
  }
}
