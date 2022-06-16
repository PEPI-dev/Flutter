import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'main.dart';
import 'package:dio/dio.dart';
// part 'dio_server.g.dart';

const _API_PREFIX = "http://cloud.park-cloud.co19.kr/project/view2.php";

// String json = {"time","temp","hum","pm2.5"};
// echo json_encode($value);

class Server{

  Future<void> getReq() async {     //getReq가 끝난다는신호를 Future에 알림
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$_API_PREFIX");
    print("response : "+response.data.toString());
    // Map<String, dynamic> test = jsonDecode(response.data.toString());
    // print(response.data.toString());    //사이트에서 받아온 데이터를 String 방식으로 받아옴
    var Time = jsonDecode(response.data.toString())[0]['time'];
    var Temp = jsonDecode(response.data.toString())[0]['temp'];
    var HUM = jsonDecode(response.data.toString())[0]['hum'];
    var PM = jsonDecode(response.data.toString())[0]['pm2.5'];
    print("Time : ${Time}");
    print("Temp : ${Temp}");
    print("HUM : ${HUM}");
    print("PM : ${PM}");
    //var data = test.fromJson();
    // var data = test.fromJson(testMap);

  }
  Future<void> postReq() async {
    Response response;
    Dio dio = new Dio();
    response = await dio
              .post(_API_PREFIX, data: {"time","temp","hum","pm2.5"});
    print(response.data.toString());
  }
  Future<void> getReqWzQueryReq() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(_API_PREFIX, queryParameters: {
    });
    print(response.data.toString());
  }
}
Server server = Server();

