import 'package:flutter/material.dart';
import 'package:json/dio_server.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
              color: Colors.lightBlue,
              onPressed: () {
                server.getReq();
              },
              child: const Text("Get")),
          FlatButton(
              color: Colors.lightBlue,
              onPressed: () {
                server.postReq();
              },
              child: const Text("POst")),
          FlatButton(
              color: Colors.lightBlue,
              onPressed: () {
                server.getReqWzQueryReq();
              },
              child: const Text("Get Query")),
        ],
      ),
    );
  }
}