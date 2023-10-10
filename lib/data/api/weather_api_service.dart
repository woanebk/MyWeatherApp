import 'dart:convert';

import 'package:my_weather_app/data/models/autocorrect_model.dart';
import 'package:my_weather_app/data/models/weather_model.dart';
import 'package:my_weather_app/data/models/error_response_model.dart';

import 'api_constants.dart';
import 'package:http/http.dart' as http;

class WeatherApiService {
  Future<WeatherModel?> getCurrentWeather({required String search}) async {
    try {
      var url = Uri.parse(
        '${ApiConstants.baseUrl}${WeatherApiUrl.getCurrentWeather}?key=${ApiConstants.apiKey}&q=$search',
      );
      var response = await http.get(url);
      if (response.statusCode == 200) {
        WeatherModel res = WeatherModel.fromJson(jsonDecode(response.body));
        return res;
      }
      throw ErrorResponseModel.fromJson(jsonDecode(response.body))
              .error
              ?.message ??
          'Error';
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<List<AutocorrectModel>?> searchPlaces({required String search}) async {
    try {
      var url = Uri.parse(
        '${ApiConstants.baseUrl}${WeatherApiUrl.search}?key=${ApiConstants.apiKey}&q=$search',
      );
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List)
            .map((e) => AutocorrectModel.fromJson(e))
            .toList();
      }
      throw ErrorResponseModel.fromJson(jsonDecode(response.body))
              .error
              ?.message ??
          'Error';
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<WeatherModel?> getForecast({required String search}) async {
    try {
      var url = Uri.parse(
        '${ApiConstants.baseUrl}${WeatherApiUrl.forecast}?key=${ApiConstants.apiKey}&q=$search&days=1',
      );
      var response = await http.get(url);
      if (response.statusCode == 200) {
        WeatherModel res = WeatherModel.fromJson(jsonDecode(response.body));
        return res;
      }
      throw ErrorResponseModel.fromJson(jsonDecode(response.body))
              .error
              ?.message ??
          'Error';
    } catch (e) {
      throw (e.toString());
    }
  }
}
