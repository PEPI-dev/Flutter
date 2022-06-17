import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'main.dart';


const _API_PREFIX = "http://cloud.park-cloud.co19.kr/project/view2.php";

class Server extends MyHomePage
{

    Future<void> getData() async{

    Response response;
    Dio dio = new Dio();
    response = await dio.get("$_API_PREFIX");
    print("response : " + response.data.toString());

    var Time = jsonDecode(response.data.toString())[0]['time'];
    var Temp = jsonDecode(response.data.toString())[0]['temp'];
    var HUM = jsonDecode(response.data.toString())[0]['hum'];
    var PM = jsonDecode(response.data.toString())[0]['pm2.5'];

    //getReq가 끝난다는신호를 Future에 알림

    print("Time : ${Time}");
    print("Temp : ${Temp}");
    print("HUM : ${HUM}");
    print("PM : ${PM}");

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                '$Time',
                style: TextStyle(
                    fontSize: 50.0
                ),
              ),
              SizedBox(
                width: 40.0,
              ),
              Text(
                '$Temp'+'℃',
                style: TextStyle(
                    fontSize: 50.0
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}

Server server = Server();