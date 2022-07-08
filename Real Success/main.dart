import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Data.dart';
import 'dart:async';


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

class InfoPage extends StatefulWidget{
  InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPage createState() => _InfoPage();

}
class _InfoPage extends State<InfoPage>{
  final List<Welcome> _user = [];

  late Timer timer;

  Future<List<Welcome>> fetchJson() async {
    var reponse = await http.get(Uri.parse('http://cloud.park-cloud.co19.kr/project/view2.php'));

    List<Welcome> ulist = [];

    if(reponse.statusCode == 200){
      var urjson = jsonDecode(reponse.body);

      for(var jsondata in urjson){
        ulist.add(Welcome.fromJson(jsondata));
      }
    }
    return ulist;
  }




  @override
  void initState(){
    fetchJson().then((value){
      setState(() {
        _user.addAll(value);
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('json'),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Card(
        child: Column(
        children: [
          Text('온도 : ' + _user[index].temp.toString() + ' °C'),
          Text('습도 : '+ _user[index].hum.toString() + '%'),
          Text('먼지농도 : '+_user[index].pm25.toString() + '%'),
        ],
        ),
        );
       },
        itemCount: _user.length,
     ),
    );
  }
}



