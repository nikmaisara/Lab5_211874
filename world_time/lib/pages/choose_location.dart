import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag: 'germany.png', latitude: '52.5200', longitude: '13.4050'),
    WorldTime(location: 'Athens', flag: 'greece.png', latitude: '37.9838', longitude: '23.7275'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', latitude: '30.0444', longitude: '31.2357'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', latitude: '1.2921', longitude: '36.8219'),
    WorldTime(location: 'Chicago', flag: 'usa.png', latitude: '41.8781', longitude: '87.6298'),
    WorldTime(location: 'New York', flag: 'usa.png', latitude: '40.7128', longitude: '74.0060'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', latitude: '37.5519', longitude: '126.9918'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', latitude: '6.2088', longitude: '106.8456'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }
  
  /*void getData() async {

    //simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'yoshi';
    });

    //simulate network request to get bio of the username
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'vega, musician & egg collector';
    });

    print('$username - $bio');
  }
  //int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('hey there!');
    //print('initState function ran');
  }*/

  @override
  Widget build(BuildContext context) {
    //print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                  //print(locations[index].location);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              )
            ),
          );
        }
      )
      
      /*body: ElevatedButton(
        onPressed: () {
          setState(() {
            //counter += 1;
          });
        },
        child: Text('counter is $counter'),
      ),*/
    );
  }
}