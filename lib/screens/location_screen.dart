import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/services/Temperatures.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  Temperatures temps = Temperatures();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temps.getTempFail();
      } else {
        temps.setTemps(weatherData);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$bg'),
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
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Current Temperature',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '$currentTemperature°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    weatherMessage,
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Center(
                  child: Card(
                    color: Color(0x293FFFF),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Here is your 5 day Forecast',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Day:$temp1Day° || Night:$temp1Night°|| $temp1WeatherIcon',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Text(
                          'Day:$temp2Day° || Night:$temp2Night°|| $temp2WeatherIcon️',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Text(
                          'Day:$temp3Day° || Night:$temp3Night°|| $temp3WeatherIcon️',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Text(
                          'Day:$temp4Day° || Night:$temp4Night°|| $temp4WeatherIcon️',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Text(
                          'Day:$temp5Day° || Night:$temp5Night°|| $temp5WeatherIcon️',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
