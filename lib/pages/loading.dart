import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // for loading icon

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // function for setting Time
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'India', flag: 'India.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime': instance.isDayTime
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    // It is the function of class which automatically called when a object created
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
