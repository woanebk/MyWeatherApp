import 'package:my_weather_app/data/models/condition.dart';

class HourModel {
  HourModel({
    this.time,
    this.tempC,
    this.condition,
  });

  HourModel.fromJson(dynamic json) {
    time = json['time'];
    tempC = ((json['temp_c'] ?? 0) as num).toDouble();
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }
  String? time;
  double? tempC;
  Condition? condition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['temp_c'] = tempC;
    if (condition != null) {
      map['condition'] = condition?.toJson();
    }
    return map;
  }
}
