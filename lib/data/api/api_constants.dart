import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.weatherapi.com/v1';
  static String apiKey = dotenv.env['API_KEY'] ?? '';
}

class WeatherApiUrl {
  static String getCurrentWeather = '/current.json';
  static String search = '/search.json';
  static String forecast = '/forecast.json';
}
