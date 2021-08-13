import 'package:camera_img/landingScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: landingScreen(),
      theme: ThemeData(),
      routes: <String, WidgetBuilder>{
        '/landingScreen' : (BuildContext context)=> new landingScreen(),
      },
    );
  }
}