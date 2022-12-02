import 'package:flutter/material.dart';
import 'package:Weatherly/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:Weatherly/screens/city.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(title: "Weatherly", home: Kol()));

class Kol extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KolState();
  }
}

class _KolState extends State<Kol> {
  var temp;

  var description;

  var currently;

  var humidity;

  var windSpeed;

  Future getWeather() async {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Kolkata&units=metric&appid=9c00fa74213b672289a880f6df770c57");

    http.Response response = await http.get(url);

    var results = jsonDecode(response.body);

    setState(() {
      this.temp = results['main']['temp'];

      this.description = results['weather'][0]['description'];

      this.currently = results['weather'][0]['main'];

      this.humidity = results['main']['humidity'];

      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();

    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.greenAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Currently in Kolkata",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  temp != null ? temp.toString() + "\u00B0" + "C" : "Loading",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "Loading",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.temperatureHalf),
                    title: Text("Temperature"),
                    trailing: Text(
                        temp != null ? temp.toString() + "\u00B0" : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text("Weather"),
                    trailing: Text(description != null
                        ? description.toString()
                        : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("Humidity"),
                    trailing: Text(
                        humidity != null ? humidity.toString() : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Wind Speed"),
                    trailing: Text(
                        windSpeed != null ? windSpeed.toString() : "Loading"),
                  ),
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => City()));
            },
            child: Text(
              'Change City',
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  backgroundColor: Colors.greenAccent),
            ),
          ),
        ],
      ),
    );
  }
}
