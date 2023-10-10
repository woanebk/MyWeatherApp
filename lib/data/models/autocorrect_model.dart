class AutocorrectModel {
  AutocorrectModel({
    this.id,
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.url,
  });

  AutocorrectModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = ((json['lat'] ?? 0) as num).toDouble();
    lon = ((json['lon'] ?? 0) as num).toDouble();
    url = json['url'];
  }
  int? id;
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['region'] = region;
    map['country'] = country;
    map['lat'] = lat;
    map['lon'] = lon;
    map['url'] = url;
    return map;
  }
}
