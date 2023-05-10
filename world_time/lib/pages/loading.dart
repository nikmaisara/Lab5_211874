import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //final apikey = '4VMLDDSY203J';

  //String time = 'loading';

  /*void getTime() async {
    //make the request
    //Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London');
    //http.Response response = await http.get(url);
    Response response = await get('http://worldtimeapi.org/api/timezone/Europe/London$url');
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //print(datetime);
    //print(offset);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    //print(now);

    //print(data['title']);
    //Response response = await get('http://worldtimeapi.org/api/timezone/Europe/London');
    /*Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    http.Response response = await http.get(url);
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);*/
    /*Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);*/
  }*/
  //int counter = 0;

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'London', 
      flag: 'london.png', 
      latitude: '51.5071',
      longitude: '0.1276');
      //url: 'Europe/Berlin');
    await instance.getTime();
    print(instance.time);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
    /*print(instance.time);
    setState(() {
      time = instance.time;
    });*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
    //print('hey there!');
    //print('initState function ran');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      /*body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text('loading'),
      ),*/
      body: Center(
        child: SpinKitWave(
          color: Color.fromARGB(255, 244, 206, 251),
          size: 50.0,
        ),
      ),
    );
  }
}