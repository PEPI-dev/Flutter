import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.time,
    required this.temp,
    required this.hum,
    required this.pm25,
  });

  DateTime time;
  String temp;
  String hum;
  String pm25;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    time: DateTime.parse(json["time"]),
    temp: json["temp"],
    hum: json["hum"],
    pm25: json["pm2.5"],
  );

  Map<String, dynamic> toJson() => {
    "time": time.toIso8601String(),
    "temp": temp,
    "hum": hum,
    "pm2.5": pm25,
  };
}