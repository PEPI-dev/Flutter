// To parse this JSON data, do
//
//     final db = dbFromJson(jsonString);

import 'dart:convert';

Db dbFromJson(String str) => Db.fromJson(json.decode(str));

String dbToJson(Db data) => json.encode(data.toJson());

class Db {
  Db({
    required this.result,
  });

  List<Result> result;

  factory Db.fromJson(Map<String, dynamic> json) => Db(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.status,
    required this.r,
    required this.g,
    required this.b,
  });

  String status;
  final String r;
  final String g;
  final String b;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    status: json["status"],
    r: json["R"],
    g: json["G"],
    b: json["B"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "R": r,
    "G": g,
    "B": b,
  };
}
