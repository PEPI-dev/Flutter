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
  var url = 'https://infuser.odcloud.kr/oas/docs?namespace=15050256/v1';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    //만약 서버가 ok응답을 반환하면, json을 파싱합니다
    print('응답했다');
    print(json.decode(response.body));
    return Info.fromJson(json.decode(response.body));
  } else {
    //만약 응답이 ok가 아니면 에러를 던집니다.
    throw Exception('계좌정보를 불러오는데 실패했습니다');
  }
}

class Info {
  final double id;
  final String userName;
  final int account;
  final int balance;

  Info(
      {required this.id,
        required this.userName,
        required this.account,
        required this.balance});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json["swagger"],
      userName: json["host"],
      account: json["format"],
      balance: json["data"],
    );
  }

}

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('info', style: TextStyle(color: Colors.white)),
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

  Widget buildColumn(snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('고객번호:' + snapshot.data!.id.toString(),
            style: TextStyle(fontSize: 20)),
        Text('고객명:' + snapshot.data!.userName.toString(),
            style: TextStyle(fontSize: 20)),
        Text('계좌 아이디:' + snapshot.data!.account.toString(),
            style: TextStyle(fontSize: 20)),
        Text('잔액:' + snapshot.data!.balance.toString() + '원',
            style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
