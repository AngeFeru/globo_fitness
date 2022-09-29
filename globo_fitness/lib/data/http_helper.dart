import 'package:flutter/foundation.dart';
import 'package:globo_fitness/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/weather.dart';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?q=Montevideo&appid=0b9105a71b7acf2304c30c34eae6fd75

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '0b9105a71b7acf2304c30c34eae6fd75';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
