import 'package:Weatherly/screens/chennai.dart';
import 'package:Weatherly/screens/delhi.dart';
import 'package:Weatherly/screens/kolkata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Weatherly/screens/mumbai.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: city(),
    );
  }
}

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    String email = '', pass = '';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Select your city",
            style: TextStyle(color: Color(0xffffffff), fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff0c7627),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            height: 250,
            width: 400,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Mum()));
              },
              child: Image.asset(
                'assets/images/Mumbai_Button.jpg',
                fit: BoxFit.fill,
                height: 300,
                width: 450,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 250,
            width: 400,
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Del()));
                },
                child: Image.asset(
                  'assets/images/Delhi_Button.jpg',
                  fit: BoxFit.fill,
                  height: 300,
                  width: 450,
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 250,
            width: 400,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Chn()));
              },
              child: Image.asset(
                'assets/images/Chennai_Button.jpg',
                fit: BoxFit.fill,
                height: 300,
                width: 450,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 250,
            width: 400,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Kol()));
              },
              child: Image.asset(
                'assets/images/Kolkata_Button.jpg',
                fit: BoxFit.fill,
                height: 300,
                width: 450,
              ),
            ),
          ),
        ])));
  }
}
