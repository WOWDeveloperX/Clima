import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:clima_x/screens/city_screen.dart';
import 'package:clima_x/services/weather.dart';
import 'package:clima_x/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int temperature;
  String weatherIcon;
  String citiName;
  String weatherMassage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMassage = 'Unable to get weather data';
        citiName = '';
        return;
      }

      citiName = weatherData['name'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt(); //преобразование двойногочисла в int

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      weatherMassage = weather.getMessage(temperature);

      print(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/2.gif'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40,
                      color: Colors.cyanAccent.shade100,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                      ;
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 40,
                      color: Colors.greenAccent.shade100,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        children: [
                          GradientText(
                            '$temperature',
                            style: TextStyle(
                              fontSize: 150,
                            ),
                            colors: [
                              Colors.blue,
                              Colors.red,
                              Colors.teal,
                            ],
                          ),
                          SizedBox(width: 30),
                          Text(
                            weatherIcon,
                            style: kConditionTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '$weatherMassage в $citiName ',
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
