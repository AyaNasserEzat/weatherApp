

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class weatherServices {
  Future<weatherModel> getWeather({required String cityName})async{
    String apiKey='532504b6848640e49be182156231207';
    String baseUrl='http://api.weatherapi.com/v1';
    Uri url=Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3');
    http.Response response=await http.get(url);
     Map<String,dynamic> data=jsonDecode(response.body);

    print(data);
  return  weatherModel.fromJson(data);
  }
}