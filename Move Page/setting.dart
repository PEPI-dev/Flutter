import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
class EditPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('H'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Hi',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
              context,
              CupertinoPageRoute(builder: (context)=> MyHomePage())
          );
        },
        tooltip: 'Move Page',
        label: Text('Move Page'),
        icon: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

