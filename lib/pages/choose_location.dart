import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class Chooselocation extends StatefulWidget {
  const Chooselocation({super.key});

  @override
  State<Chooselocation> createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {

  List<WorldTime> locations = [
    WorldTime('America/New_York', 'New York', 'usa.png'),
    WorldTime('Europe/London','London', 'london.png'),
    WorldTime('Asia/Tokyo', 'Tokyo', 'japan.png'),
    WorldTime('Asia/Hong_Kong', 'Hong Kong', 'china.png'),
    WorldTime('Asia/Krasnoyarsk', 'Russia', 'russia.png'),
    WorldTime('Europe/Berlin','Athens', 'greece.png'),
    WorldTime('Africa/Nairobi', 'Nairobi', 'kenya.png'),    
    WorldTime('Asia/Seoul', 'Seoul', 'south_korea.png'),
    WorldTime('Asia/colombo', 'Colombo', 'sl.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to homescreen
    Navigator.pop(context , {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Coose Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}