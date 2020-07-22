import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';

int currentTemperature;
String weatherIcon;

int temp1Day;
int temp1Night;
String temp1WeatherIcon;

int temp2Day;
int temp2Night;
String temp2WeatherIcon;

int temp3Day;
int temp3Night;
String temp3WeatherIcon;

int temp4Day;
int temp4Night;
String temp4WeatherIcon;

int temp5Day;
int temp5Night;
String temp5WeatherIcon;

String weatherMessage;
String bg;

class Temperatures {
  WeatherModel weather = WeatherModel();
  void getTempFail() {
    currentTemperature = 0;
    weatherMessage = "Sorry something went wrong";
    temp1Day = 0;
    temp1Night = 0;
    temp1WeatherIcon = "n/a";
    temp2Day = 0;
    temp2Night = 0;
    temp2WeatherIcon = "n/a";
    temp3Day = 0;
    temp3Night = 0;
    temp3WeatherIcon = "n/a";
    temp4Day = 0;
    temp4Night = 0;
    temp5Day = 0;
    temp5Night = 0;
  }

  void setTemps(dynamic weatherData) {
    var tempAsDouble = weatherData['current']['temp'];
    currentTemperature = tempAsDouble.toInt();
    var currentWeatherID = weatherData['current']['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(currentWeatherID);
    weatherMessage = weather.getMessage(currentTemperature);
    bg = weather.getBackgroud(currentWeatherID);

    var temp1DayDouble = weatherData['daily'][0]['temp']['day'];
    temp1Day = temp1DayDouble.toInt();
    var temp1NightDouble = weatherData['daily'][0]['temp']['night'];
    temp1Night = temp1NightDouble.toInt();
    var temp1WeatherID = weatherData['daily'][0]['weather'][0]['id'];
    temp1WeatherIcon = weather.getWeatherIcon(temp1WeatherID);

    var temp2DayDouble = weatherData['daily'][1]['temp']['day'];
    temp2Day = temp2DayDouble.toInt();
    var temp2NightDouble = weatherData['daily'][1]['temp']['night'];
    temp2Night = temp2NightDouble.toInt();
    var temp2WeatherID = weatherData['daily'][1]['weather'][0]['id'];
    temp2WeatherIcon = weather.getWeatherIcon(temp2WeatherID);

    var temp3DayDouble = weatherData['daily'][2]['temp']['day'];
    temp3Day = temp3DayDouble.toInt();
    var temp3NightDouble = weatherData['daily'][2]['temp']['night'];
    temp3Night = temp3NightDouble.toInt();
    var temp3WeatherID = weatherData['daily'][2]['weather'][0]['id'];
    temp3WeatherIcon = weather.getWeatherIcon(temp3WeatherID);

    var temp4DayDouble = weatherData['daily'][3]['temp']['day'];
    temp4Day = temp4DayDouble.toInt();
    var temp4NightDouble = weatherData['daily'][3]['temp']['night'];
    temp4Night = temp4NightDouble.toInt();
    var temp4WeatherID = weatherData['daily'][3]['weather'][0]['id'];
    temp4WeatherIcon = weather.getWeatherIcon(temp4WeatherID);

    var temp5DayDouble = weatherData['daily'][4]['temp']['day'];
    temp5Day = temp5DayDouble.toInt();
    var temp5NightDouble = weatherData['daily'][4]['temp']['night'];
    temp5Night = temp5NightDouble.toInt();
    var temp5WeatherID = weatherData['daily'][4]['weather'][0]['id'];
    temp5WeatherIcon = weather.getWeatherIcon(temp5WeatherID);
  }
}
