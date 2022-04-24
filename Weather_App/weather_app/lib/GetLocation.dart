import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/SecondScreen.dart';
import 'SecondScreen.dart';
import 'Screen1.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var permissions;
  void getCurrentPosition() async {
    permissions = await Geolocator.checkPermission();

    if (permissions == LocationPermission.denied) {
      permissions = Geolocator.requestPermission();

      if (permissions == LocationPermission.denied) {
        print('Permission denied');
      }
    }

    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(pos.latitude);
    print(pos.longitude);
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Weather App')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple),
                  child: TextButton(
                    onPressed: (() {
                      setState(() {
                        getCurrentPosition();
                      });
                    }),
                    child: Center(
                        child: Text(
                      "Get Current Position",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Screen1(),
              )
            ],
          )),
    );
  }
}
