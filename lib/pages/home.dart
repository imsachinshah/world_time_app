import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // set background
    String bgimage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 135.0, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDayTime': result['isDayTime']
                      };
                    });
                  },
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
