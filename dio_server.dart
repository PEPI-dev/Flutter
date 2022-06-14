import 'package:dio/dio.dart';

const _API_PREFIX = "http://cloud.park-cloud.co19.kr/project/view2.php";

class Server {
  Future<void> getReq() async {     //getReq가 끝난다는신호를 Future에 알림
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$_API_PREFIX");
    print(response.data.toString());    //사이트에서 받아온 데이터를 String 방식으로 받아옴
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