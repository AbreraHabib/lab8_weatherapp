import 'package:flutter/material.dart';
import 'package:weather_app/GetLocation.dart';
import 'main.dart';
import 'Screen1.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.purple),
          child: TextButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            }),
            child: Center(
                child: Text(
              "Go to first screen",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
