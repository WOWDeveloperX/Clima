import 'package:clima_x/screens/location_screen.dart';
import 'package:clima_x/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
// WeatherModel weatherModel = WeatherModel(); //иницилизировал в weatherData

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitSpinningLines(
        color: Colors.amber,
        size: 300,
      )),
    );
  }
}
