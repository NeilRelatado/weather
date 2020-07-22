import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'bf5b110e6ad48367444d5292e3a69b33';
const WeatherMapUrl = 'https://api.openweathermap.org/data/2.5/onecall';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$WeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&%20exclude=hourly,daily&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    print('weather updated');
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
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return "It's a hot one today";
    } else if (temp > 20) {
      return "It's a nice day!";
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getBackgroud(int condition) {
    if (condition == 800) {
      return 'images/SunnydayWallpaper.jpg';
    } else if (condition <= 800 || condition < 800 || condition <= 804) {
      return 'images/cloudydaywallpaper.jpg';
    } else if (condition < 600 || condition < 400 || condition < 300) {
      return 'images/rainydaywallpaper.jpg';
    } else if (condition < 700) {
      return 'images/snowingwallpaper.jpg';
    } else {
      return 'images/location_background.jpg';
    }
  }
}
