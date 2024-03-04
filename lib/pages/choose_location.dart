import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart ';

class ChooseArea extends StatefulWidget {

  @override
  State<ChooseArea> createState() => _ChooseAreaState();
}

class _ChooseAreaState extends State<ChooseArea> {
  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag: 'de.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'eg.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'ke.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'us.png', url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'us.png', url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'kr.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'id.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Dhaka', flag: 'bd.png', url: 'Asia/Dhaka'),
    WorldTime(location: 'Kathmandu', flag: 'np.png', url: 'Asia/Kathmandu'),
    WorldTime(location: 'Kolkata', flag: 'in.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'New Delhi', flag: 'in.png', url: 'Asia/New_Delhi'),
    WorldTime(location: 'Karachi', flag: 'pk.png', url: 'Asia/Karachi'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        title: const Text('Choose A Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:  ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  Navigator.pop(context, {
                    'location': locations[index].location,
                    'flag': locations[index].flag,
                    'url': locations[index].url,
                  });
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
