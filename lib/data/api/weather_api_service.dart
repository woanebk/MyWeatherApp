import 'dart:convert';

import 'package:my_weather_app/data/models/Current_weather_model.dart';

import 'api_constants.dart';
import 'package:http/http.dart' as http;

class WeatherApiService {
  Future<CurrentWeatherModel?> getCurrentWeather(
      {required String search}) async {
    try {
      var url = Uri.parse(
        '${ApiConstants.baseUrl}${WeatherApiUrl.getCurrentWeather}?key=${ApiConstants.apiKey}&q=$search',
      );
      var response = await http.get(url);
      if (response.statusCode == 200) {
        CurrentWeatherModel res =
            CurrentWeatherModel.fromJson(jsonDecode(response.body));
        return res;
      }
      return null;
    } catch (e) {
      throw (e.toString());
    }
  }
}
