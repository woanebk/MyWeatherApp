import 'package:my_weather_app/data/models/test/hour_model.dart';

import 'day_model.dart';

class Forecastday {
  Forecastday({this.date, this.dateEpoch, this.day, this.hour});

  Forecastday.fromJson(dynamic json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    if (json['hour'] != null) {
      hour = [];
      json['hour'].forEach((v) {
        hour?.add(HourModel.fromJson(v));
      });
    }
  }
  String? date;
  int? dateEpoch;
  Day? day;
  List<HourModel>? hour;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['date_epoch'] = dateEpoch;
    if (day != null) {
      map['day'] = day?.toJson();
    }
    if (hour != null) {
      map['hour'] = hour?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
