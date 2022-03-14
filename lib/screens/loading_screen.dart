import 'package:clima_x/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as htpp;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
    getData();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  Future<void> getData() async {
    htpp.Response response = await htpp.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02'));

    // print(response.body); тело ответа
    // print(response.statusCode); код ответа

    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      // var longitudeResponse = jsonDecode(data)['coord']['lon'];
      // print(longitudeResponse);

      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      // print(weatherDescription);

      //TODO  1 переменная с температурой  1 temз  2 id 800  3  название города

      //HACK

      double temp = jsonDecode(data)['main']['temp'];
      int weatherId = jsonDecode(data)['weather'][0]['id'];
      String nameCiti = jsonDecode(data)['name'];

      print(temp);
      print(weatherId);
      print(nameCiti);

      //HACK

    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
