import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

import 'main.dart';

class StrmBar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isRunning = useState(true);

    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0.92),
              child: InkWell(
                  child: Image.asset('images/home.png',
                      width: 60,
                      height: 60,
                      alignment: AlignmentDirectional(0, 1)),
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => MainPage()));
                  }),
            ),
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Mjpeg(
                      isLive: isRunning.value,
                      error: (context, error, stack) {
                        print(error);
                        print(stack);
                        return Text(error.toString(),
                            style: TextStyle(color: Colors.red));
                      },
                      stream: 'http://10.10.141.250:8080/?action=stream',
                    ),
                    Mjpeg(
                      isLive: isRunning.value,
                      error: (context, error, stack) {
                        print(error);
                        print(stack);
                        return Text(error.toString(),
                            style: TextStyle(color: Colors.red));
                      },
                      stream: 'http://10.10.141.250:8081/?action=stream',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
