// To parse this JSON data, do
//
//     final clientTypesModel = clientTypesModelFromJson(jsonString);

import 'dart:convert';

ClientTypesModel clientTypesModelFromJson(String str) =>
    ClientTypesModel.fromJson(json.decode(str));

String clientTypesModelToJson(ClientTypesModel data) =>
    json.encode(data.toJson());

class ClientTypesModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  ClientTypesModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ClientTypesModel.fromJson(Map<String, dynamic> json) =>
      ClientTypesModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? name;

  Result({
    this.name,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
