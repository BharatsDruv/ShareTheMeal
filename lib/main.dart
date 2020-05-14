import 'package:flutter/material.dart';
import 'package:sharemymeal/background.dart';
import 'package:sharemymeal/login.dart';
import 'package:sharemymeal/ngo_home.dart';
import 'package:sharemymeal/user_home.dart';

import 'ngo_map.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget
{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
      debugShowCheckedModeBanner: false,
      title: 'Share The Meal',
      theme: ThemeData
        (
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Share The Meal'),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            // UserhomePage()
            Background(),
            Login(),
          ],
        ));
  }
}