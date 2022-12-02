import 'package:Weatherly/screens/city.dart';
import 'package:Weatherly/screens/mumbai.dart';
import 'package:Weatherly/screens/signin.dart';
import 'package:Weatherly/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//void main() => runApp(const MyApp());
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBOrsIs86ZDefk0Ig39VGYxajcOY7w2WV4",
      appId: "1:847525746474:android:82787dc90c6ca6ed0fb053",
      messagingSenderId: "847525746474",
      projectId: "weatherly-c6a7e",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/sky 2.png"),
                    fit: BoxFit.cover)),
            child: const MyLoad(),
          )
          //const MyLoad(),
          ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyLoad extends StatefulWidget {
  const MyLoad({Key? key}) : super(key: key);

  @override
  State<MyLoad> createState() => _MyLoadState();
}

class _MyLoadState extends State<MyLoad> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUpDemo()));
              },
              child: Text(
                'Press here to Continue',
                style: TextStyle(color: Color(0xffffffff), fontSize: 20),
              ),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: 30.0, top: 50.0, right: 30.0, bottom: 20.0),
                child: const Text(
                  'WEATHERLY',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Nerko One",
                      fontSize: 40),
                )),
            Image.asset('assets/images/sun_cloud-removebg-preview.png'),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: 30.0, top: 100.0, right: 30.0, bottom: 20.0),
                child: const Text(
                  'Your Daily Weather Guide ',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                )),
          ],
        ));
  }
}
