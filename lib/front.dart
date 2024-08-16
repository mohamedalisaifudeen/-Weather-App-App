import 'dart:convert';
import 'dart:ui';
import 'Text.dart';
import 'package:flutter/painting.dart';
import 'appIco.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'weather.dart';
import 'cityScreen.dart';

class First extends StatefulWidget {
  final data;
  First({required String this.data});

  Weather weather = Weather();

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  late int condition;
  late double temp;
  late String city;

  static const backgroundImg = BoxDecoration(
      image: DecorationImage(
    image: AssetImage("images/climate.jpg"),
    fit: BoxFit.cover,
  ));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherDta(widget.data);
  }

  void weatherDta(String dta) {
    setState(() {
      temp = jsonDecode(dta)['main']['temp'];
      condition = jsonDecode(dta)['weather'][0]['id'];
      city = jsonDecode(dta)['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                child: AppIcon(
              icon: Icons.near_me,
              weight: 50,
              size: 50,
              edge: EdgeInsets.only(left: 11),
            ),
              onPressed: ()async{
                  String dta=await Weather().getWeather();
                  weatherDta(dta);
              },
            ),
            TextButton(
              onPressed: ()async{
                var cityTxt=await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CityScreen()),
                );
                if(cityTxt!=null){
                  String dta=await widget.weather.cityData(cityTxt);
                  weatherDta(dta);
                }
              },
              child: AppIcon(
                icon: Icons.location_city,
                weight: 50,
                size: 50,
                edge: EdgeInsets.only(right: 11),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: backgroundImg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Center(
                    child: Txt(
                        edge: EdgeInsets.only(left: 20),
                        txt: (temp - 273.15).round().toString() + "°",
                        align: TextAlign.left,
                        size: 100),
                  ),
                  Text(
                    widget.weather.weatherIcon(condition),
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Txt(
              size: 55,
              align: TextAlign.end,
              txt: "${widget.weather.getMessage(temp - 273.15)} $city",
              edge: EdgeInsets.only(right: 18, left: 33),
            )),
          ],
        ),
      ),
    ));
  }
}
