import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';
class searchPage extends StatelessWidget {
   searchPage({Key? key,required this.updateUi}) : super(key: key);
  String? cityName;
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              onSubmitted: (String name)async{
                cityName=name;
              weatherServices service=weatherServices();
                weatherModel weather= await service.getWeather(cityName :cityName!);
                print(weather);
                Provider.of<weatherPeovider>(context,listen: false).weatherData=weather;
                Provider.of<weatherPeovider>(context,listen: false).cityName=cityName;
                //updateUi!();
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                border: OutlineInputBorder(),
                hintText: 'enter city name',
                label: Text('search'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

