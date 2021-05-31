import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom/widgets/home.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.green,
      ),
      routes: <String, WidgetBuilder>{
        "/Home": (context) => Home(),
      },
      home: Home()
    );
  }
}


