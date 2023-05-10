import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location name for the UI
  String time = ''; //the time in that location
  String flag; //url to an asset flag icon
  //String url; //location url for api endpoint
  String latitude;
  String longitude;
  bool isDaytime = true; //true or false if daytime or not
  final apiKey = '4VMLDDSY203J';

  WorldTime({required this.location, required this.flag, required this.latitude, required this.longitude});

  Future<void> getTime() async {

    try {
      //make the request
      Response response = await get(Uri.parse(
        'https://api.timezonedb.com/v2.1/get-time-zone?key=$apiKey&format=json&by=position&lat=$latitude&lng=$longitude'
      ));
      //Uri url = Uri.parse('http://api.timezonedb.com/v2.1/get-time-zone?key=$apiKey&format=json&by=position&$latitude=51.5072&$longitude=0.1276');
      //Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      //http.Response response = await http.get(url);
      //Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String formatted = data['formatted'];
      String dst = data['dst'].toString();
      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(formatted);
      now = now.add(Duration(hours: int.parse(dst)));
      //print(now);

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      //time = now.toString();

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
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

    /*
    //make the request
    //Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London');
    //http.Response response = await http.get(url);
    Response response = await get('http://worldtimeapi.org/api/timezones/$url');
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

    //set the time property
    time = now.toString();

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
    */
  }

}

/*WorldTime instance = WorldTime(
  location: 'Berlin', 
  flag: 'germany.png', 
  latitude: '51.5072',
  longitude: '0.1276'
);*/
//instance.getTime()