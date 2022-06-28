import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MaterialApp',
        theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.greenAccent,
        accentColor: Colors.redAccent,
    ),
        home: InfoPage()
    );
  }
}

Future<Info> fetchInfo() async {
  var url = 'http://cloud.park-cloud.co19.kr/project/view2.php';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    //만약 서버가 ok응답을 반환하면, json을 파싱합니다
    print('Receive Data Succeed!');
    print(json.decode(response.body));
    return Info.fromJson(json.decode(response.body));
  } else {
    //만약 응답이 ok가 아니면 에러를 던집니다.
    throw Exception('Error 69 : Cannot Found Data In Query!');
  }
}

class Info {
  final int time;
  final int temp;
  final int hum;
  final int pm;

  Info(
      { required this.time,
        required this.temp,
        required this.hum,
        required this.pm});



  /*
  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      time: json["time"],
      temp: json["temp"],
      hum: json["hum"],
      pm: json["pm2.5"],
    );
  }     */

}

class InfoPage extends StatefulWidget {


  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Future<Info>? info;

  @override
  void initState() {
    super.initState();
    info = fetchInfo();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('My Room', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<Info>(
            //통신데이터 가져오기
            future: info,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return buildColumn(snapshot);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}에러!!");
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }

      Widget buildColumn(snapshot){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('시간:' + snapshot.data!.time.toString(),
              style: TextStyle(fontSize: 20)),
          Text('온도:' + snapshot.data!.temp.toString(),
              style: TextStyle(fontSize: 20)),
          Text('습도:' + snapshot.data!.hum.toString(),
              style: TextStyle(fontSize: 20)),
          Text('먼지농도:' + snapshot.data!.pm.toString(),
              style: TextStyle(fontSize: 20)),
         ],
      );
  }
}

