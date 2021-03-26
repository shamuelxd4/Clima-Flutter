import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = "92a42f9af4738c44374ab3d642838f70";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitud;
    longitude = location.longitud;

    Networking networking = Networking(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");

    var weatherData = await networking.getData();

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 100,
          ),
        ),
      ),
    );
  }
}
