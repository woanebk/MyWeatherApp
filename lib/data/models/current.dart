import 'condition.dart';

class Current {
  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  Current.fromJson(dynamic json) {
    lastUpdatedEpoch = ((json['last_updated_epoch'] ?? 0) as num).toDouble();
    lastUpdated = json['last_updated'];
    tempC = ((json['temp_c'] ?? 0) as num).toDouble();
    tempF = ((json['temp_f'] ?? 0) as num).toDouble();
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windMph = ((json['windMph'] ?? 0) as num).toDouble();
    windKph = ((json['windKph'] ?? 0) as num).toDouble();
    windDegree = ((json['wind_degree'] ?? 0) as num).toDouble();
    windDir = json['wind_dir'];
    pressureMb = ((json['pressureMb'] ?? 0) as num).toDouble();
    pressureIn = ((json['pressureIn'] ?? 0) as num).toDouble();
    precipMm = ((json['precipMm'] ?? 0) as num).toDouble();
    precipIn = ((json['precipIn'] ?? 0) as num).toDouble();
    humidity = ((json['humidity'] ?? 0) as num).toDouble();
    cloud = ((json['cloud'] ?? 0) as num).toDouble();
    feelslikeC = ((json['feelslikeC'] ?? 0) as num).toDouble();
    feelslikeF = ((json['feelslikeF'] ?? 0) as num).toDouble();
    visKm = ((json['visKm'] ?? 0) as num).toDouble();
    visMiles = ((json['visMiles'] ?? 0) as num).toDouble();
    uv = ((json['uv'] ?? 0) as num).toDouble();
    gustMph = ((json['gustMph'] ?? 0) as num).toDouble();
    gustKph = ((json['gustKph'] ?? 0) as num).toDouble();
  }
  double? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  double? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  double? humidity;
  double? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_updated_epoch'] = lastUpdatedEpoch;
    map['last_updated'] = lastUpdated;
    map['temp_c'] = tempC;
    map['temp_f'] = tempF;
    map['is_day'] = isDay;
    if (condition != null) {
      map['condition'] = condition?.toJson();
    }
    map['wind_mph'] = windMph;
    map['wind_kph'] = windKph;
    map['wind_degree'] = windDegree;
    map['wind_dir'] = windDir;
    map['pressure_mb'] = pressureMb;
    map['pressure_in'] = pressureIn;
    map['precip_mm'] = precipMm;
    map['precip_in'] = precipIn;
    map['humidity'] = humidity;
    map['cloud'] = cloud;
    map['feelslike_c'] = feelslikeC;
    map['feelslike_f'] = feelslikeF;
    map['vis_km'] = visKm;
    map['vis_miles'] = visMiles;
    map['uv'] = uv;
    map['gust_mph'] = gustMph;
    map['gust_kph'] = gustKph;
    return map;
  }
}
