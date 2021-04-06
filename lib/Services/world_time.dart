//import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  
  String location;//Location name for the UI
  String time;//The time in that location 
  String flag;//URL to an assest flag icon 
  String url;//Location URL for API endpoint 
  bool isDaytime;//True or false if daytime or not 
  
  WorldTime({this.location, this.flag, this.url});

  Future <void> getTime()async{

    try{

      // Make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      print(offset);
      //Create datatime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset))); 

      isDaytime = now.hour > 6 && now.hour < 20  ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught error $e');
      time = 'could not get time ';
    }

  }
}


