import 'package:flutter/material.dart';
import '../services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Melbourne', flag: 'australia.png', url: 'Australia/Melbourne'),
    WorldTime(location: 'Los Angeles', flag: 'usa.png', url: 'America/Los_Angeles'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("Select Location"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              color: Colors.grey[800],
              margin: EdgeInsets.all(3.0),
              child: ListTile(
              onTap: () {
                updateTime(index);
              },
                title: Text(locations[index].location,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}')
                ),
              )
            ),
          );
        }
      )
    );
  }
}
