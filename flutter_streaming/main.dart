import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:streaming/strm.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'db.dart';
import 'login.dart';

void main() async
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  bool clickbtn = true;
  final List<Result> _db = [];

  Future<List<Result>> fetchJson() async {
    var reponse = await http
        .get(Uri.parse('http://cloud.park-cloud.co19.kr/project/view_status.php'));

    List<Result> ulist = [];

    if (reponse.statusCode == 200) {
      var urjson = jsonDecode(reponse.body);

      for (var jsondata in urjson) {
        ulist.add(Result.fromJson(jsondata));
      }
    }
    return ulist;
  }

  @override
  void initState() {
    fetchJson().then((value) {
      setState(() {
        _db.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(-0.88, -0.98),
              child: Image.asset(
                'images/server.png',
                width: 70,
                height: 70,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.35, -0.92),
              child: Text(
                'JJJS Client',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.3),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'R : ' + _db[index].r.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          'R : ' + _db[index].g.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          'R : ' + _db[index].b.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: _db.length,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.9),
              child: InkWell(
                child: Image.asset(
                  'images/live.png',
                  width: 80,
                  height: 80,
                ),
                onTap: () {
                  clickbtn = !clickbtn;
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Login())

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
