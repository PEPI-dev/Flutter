import 'package:flutter/material.dart';
import 'dart:convert';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const JSONTest(),
    );
  }
}

class JSONTest extends StatelessWidget {
  const JSONTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String json ='{"name: "kdh","email": "kdhtod98@naver.com"}';

    Map<String, dynamic>
    userMap = jsonDecode(json);
    var user = User.fromJson(userMap);
    var jsonData=user.toJson();
    return Scaffold(
      body: Center(child: Text('name: ${user.name} \n email: ${user.email} \n',textScaleFactor: 2,))
    );
  }
}


