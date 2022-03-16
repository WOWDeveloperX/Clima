import 'package:http/http.dart' as htpp;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    htpp.Response response = await htpp.get(Uri.parse(url));

    print(response.statusCode);
    // print(response.body);   //тело ответа

    if (response.statusCode == 200) {
      String data = response.body;

      // print(data); //иницилизированное тело ответа

      var decodeData = jsonDecode(data);

      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}

  //  'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'
