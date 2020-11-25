import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location ; // location name for UI
  String time; // the time in that location
  String flag; // url to assert flag icon
  String url; // location url for api endpoint
  bool isDayTime; // for dayTime

  WorldTime({ this.location, this.flag, this.url});

  // Future void is use to use async function outside the module

  Future<void> getTime() async{

    try {
      // Make a request
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      // Get Date Time from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      String offset1 = data['utc_offset'].substring(4, 6);
      //print(offset1);

      //int hrs = int.parse(offset.substring(1,3));
      //int min = int.parse(offset.substring(5,7));
      //print(hrs);

      // Create DateTime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offset1)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('Caught Error $e');
      time = 'Time not found ';
    }
  }
}

