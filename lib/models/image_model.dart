// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ImageModel> vehicleModelFromJson(String str) => List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));

String vehicleModelToJson(List<ImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageModel {
    ImageModel({
        required this.id,
        required this.image,
        required this.uniqueId,
        required this.vehicle,
    });

    int id;
    String image;
    String uniqueId;
    String vehicle;

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        image: json["image"],
        uniqueId: json["unique_id"],
        vehicle: json["vehicle"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "unique_id": uniqueId,
        "vehicle": vehicle,
    };
}