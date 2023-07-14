
import 'package:flutter/foundation.dart';
import 'package:weather_app/models/weather_model.dart';

class weatherPeovider extends ChangeNotifier{
  weatherModel? _weatherData;
  String? cityName;
  set weatherData(weatherModel? weather){
    _weatherData=weather;
    notifyListeners();
  }
  weatherModel? get weatherData =>_weatherData;

}