import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

void main() {
  runApp(weatherApp());
}

class weatherApp extends StatefulWidget {
  const weatherApp({Key? key}) : super(key: key);

  @override
  State<weatherApp> createState() => _weatherAppState();
}

class _weatherAppState extends State<weatherApp> {
  void updateUi(){
    setState(() {

    });
  }
  weatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<weatherPeovider>(context).weatherData;
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text('weatherApp'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return searchPage(updateUi: updateUi);
                  }));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body:Provider.of<weatherPeovider>(context).weatherData==null? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'thir is no weather to 😔 start',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
        :
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3,),
                Text(Provider.of<weatherPeovider>(context).cityName!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),),
                Text('updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',style: TextStyle(fontSize: 20),),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Image.asset(weatherData!.getImage()),

                    Text('${weatherData!.temp.toInt().toString()}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),

                    Column(
                      children: [
                        Text('minTemp = ${weatherData!.maxTem.toInt()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text('maxTemp ${weatherData!.minTemp.toInt()} =',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ],),


                    ],),
                Spacer(),
                    Text('${weatherData!.weatherStateName}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                Spacer(flex: 5,),

              ],

      ),
          )
      ),
    );
  }
}
