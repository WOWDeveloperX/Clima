import 'package:clima_x/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as htpp;
import 'dart:convert';

const apiKey = '0b1568b066afb5101600ea8e8c60e424';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    getLocation();
    getData();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    getData();
  }

  Future<void> getData() async {
    htpp.Response response = await htpp.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));

    // print(response.statusCode);
    // print(response.body); тело ответа

    if (response.statusCode == 200) {
      String data = response.body;

      // print(data); иницилизированное тело ответа
      // var longitudeResponse = jsonDecode(data)['coord']['lon'];
      // print(longitudeResponse);
      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      // print(weatherDescription);

      double temp = jsonDecode(data)['main']['temp'];
      int weatherId = jsonDecode(data)['weather'][0]['id'];
      String nameCiti = jsonDecode(data)['name'];

      print(temp);
      print(weatherId);
      print(nameCiti);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


// https://api.openweathermap.org/data/2.5/weather?lat=55=37&appid=0b1568b066afb5101600ea8e8c60e424