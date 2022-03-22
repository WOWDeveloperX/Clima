import 'package:clima_x/services/location.dart';
import 'package:clima_x/services/networking.dart';

const apiKey = '0b1568b066afb5101600ea8e8c60e424';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper =
        NetworkHelper(url); //способ инициализации в 2 строки

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    // latitude = location.latitude;   сделал перенос сразу в  url значение!
    // longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '🔆';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Время для🍦';
    } else if (temp > 20) {
      return 'время для шорт и 👕';
    } else if (temp < 10) {
      return 'Одевать 🧣 и 🧤';
    } else {
      return 'Прихвати 🧥';
    }
  }
}
