import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data= data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async {
                      dynamic newData = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': newData['time'],
                          'location': newData['location'],
                          'flag': newData['flag'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location_alt_sharp,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    label: Text('Change Location',
                      style: TextStyle(
                        fontSize: 15.0,
                        letterSpacing: 3.0,
                        color: Colors.white,
                      ),)
                ),
                SizedBox(height: 75.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                        letterSpacing: 8.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45.0,
                    letterSpacing: 5.0,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
