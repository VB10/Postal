import 'package:flutter/material.dart';
import './login/login.dart';
import './tab/packet/main.dart';
import './tab/tab.dart';
import './login/main.dart';

void main() => runApp(MyApp());

enum PREFKEY{
  userId
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(), );
  }
}

