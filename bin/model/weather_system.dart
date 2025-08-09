import 'dart:math';

import '../data/enum.dart';

class WeatherSystem {
  static Weather generateRandomWeather() {
    final random = Random();
    return Weather.values[random.nextInt(Weather.values.length)];
  }

  static getWeatherDescription(Weather weather) {
    switch (weather) {
      case Weather.sunny:
        return "Perfect conditions for football!";
      case Weather.rainy:
        return "Slippery conditions may affect passing.";
      case Weather.snowy:
        return "Challenging snowy conditions!";
      case Weather.windy:
        return "Strong winds affecting long passes.";
    }
  }
}
