import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = "92a42f9af4738c44374ab3d642838f70";
const weatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityweather(String cityName) async {
    
    Networking networking = Networking(
        "$weatherMapURL?q=$cityName&appid=$apiKey&units=metric");

    var weatherData = await networking.getData();

    return weatherData;
  }
  //-------------------------
  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    Networking networking = Networking(
        "$weatherMapURL?lat=${location.latitud}&lon=${location.longitud}&appid=$apiKey&units=metric");

    var weatherData = await networking.getData();

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
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
