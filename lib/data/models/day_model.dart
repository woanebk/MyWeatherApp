class Day {
  Day({
    this.maxtempC,
    this.mintempC,
    this.avgtempC,
  });

  Day.fromJson(dynamic json) {
    maxtempC = ((json['maxtemp_c'] ?? 0) as num).toDouble();
    mintempC = ((json['mintempC'] ?? 0) as num).toDouble();
    avgtempC = ((json['avgtempC'] ?? 0) as num).toDouble();
  }
  double? maxtempC;
  double? mintempC;
  double? avgtempC;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maxtemp_c'] = maxtempC;
    map['mintemp_c'] = mintempC;
    map['avgtemp_c'] = avgtempC;
    return map;
  }
}
