// To parse this JSON data, do
//
//     final modelModel = modelModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ModelModel> modelModelFromJson(String str) => List<ModelModel>.from(json.decode(str).map((x) => ModelModel.fromJson(x)));

String modelModelToJson(List<ModelModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelModel {
    ModelModel({
        required this.id,
        required this.make,
        required this.name,
    });

    int id;
    Make make;
    String name;

    factory ModelModel.fromJson(Map<String, dynamic> json) => ModelModel(
        id: json["id"],
        make: Make.fromJson(json["make"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "make": make.toJson(),
        "name": name,
    };
}

class Make {
    Make({
        required this.id,
        required this.name,
    });

    int id;
    String name;

    factory Make.fromJson(Map<String, dynamic> json) => Make(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}




