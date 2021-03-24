import 'package:flutter/material.dart';

import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitud);
    print(location.longitud);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=London&appid=92a42f9af4738c44374ab3d642838f70"));
    if (response.statusCode == 200) {
      //String data = response.body;
      var dataJson = jsonDecode(response.body.toString());

      //weather->id, main->temp, name
      int dId = dataJson['weather'][0]['id'];
      String dName = dataJson['name'];
      double dTemp = dataJson['main']['temp'];

      print(dId);
      print(dName);
      print(dTemp);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    print('===================initState==================');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
