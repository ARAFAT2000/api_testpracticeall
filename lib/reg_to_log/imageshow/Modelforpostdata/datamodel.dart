// To parse this JSON data, do
//
   //  final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  String name;
  String job;
  String id;

  DataModel({
    required this.name,
    required this.job,
    required this.id,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    name: json["name"],
    job: json["job"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
  };
}
