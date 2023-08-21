import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String url; //location url for api endpoint
  String location;  //location name for UI
  String flag;  //asset flag icon
  String? time;  //time in that location
  bool? isDayTime; //finding day or time 

  WorldTime( this.url,this.location,this.flag,[this.time,this.isDayTime]);

  Future<void> getTime() async {

    try{
      // make the request
      var path = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(path);
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch(e) {
      print("Caught Error");
      time = "Could not get Time data";
    }    
  }
}