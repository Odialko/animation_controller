import 'package:flutter/material.dart';
import 'package:flutter_animation_controller/animated_bender.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          title: Text('Animation controller', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  AnimatedBenderWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
