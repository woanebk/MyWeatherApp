import 'package:my_weather_app/data/models/forecast_model.dart';

import 'location.dart';
import 'current.dart';

class WeatherModel {
  WeatherModel({this.location, this.current, this.forecast});

  WeatherModel.fromJson(dynamic json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast =
        json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }
  Location? location;
  Current? current;
  Forecast? forecast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }

    if (forecast != null) {
      map['forecast'] = forecast?.toJson();
    }
    return map;
  }
}
