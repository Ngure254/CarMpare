// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

import 'package:car_list/models/model_model.dart';

VehicleModel vehicleModelFromJson(String str) => VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

class VehicleModel {
    VehicleModel({
       required this.count,
        required  this.next,
        required  this.previous,
        required  this.results,
    });

    int count;
    String next;
    dynamic previous;
    List<Result> results;

    factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
         required this.id,
         required this.model,
         required this.addedBy,
         required this.features,
         required this.numberPlate,
         required this.year,
         required this.sellingPrice,
         required this.mileage,
         required this.color,
         required this.condition,
         required this.engineSize,
         required this.transmissionType,
         required this.fuelType,
         required this.bodyType,
         required this.driveType,
         required this.interior,
         required this.description,
         required this.created,
         required this.updated,
         required this.sold,
         required this.featured,
         required this.slug,
         required this.salesPersonEmail,
         required this.salesPersonPhoneNumber,
    });

    int id;
    Model model;
    String addedBy;
    List<Feature> features;
    String numberPlate;
    int year;
    int sellingPrice;
    int mileage;
    String color;
    String condition;
    String engineSize;
    String transmissionType;
    String fuelType;
    String bodyType;
    String driveType;
    String interior;
    String description;
    DateTime created;
    DateTime updated;
    bool sold;
    bool featured;
    String slug;
    String salesPersonEmail;
    String salesPersonPhoneNumber;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        model: Model.fromJson(json["model"]),
        addedBy: json["added_by"],
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
        numberPlate: json["number_plate"],
        year: json["year"],
        sellingPrice: json["selling_price"],
        mileage: json["mileage"],
        color: json["color"],
        condition: json["condition"],
        engineSize: json["engine_size"],
        transmissionType: json["transmission_type"],
        fuelType: json["fuel_type"],
        bodyType: json["body_type"],
        driveType: json["drive_type"],
        interior: json["interior"],
        description: json["description"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        sold: json["sold"],
        featured: json["featured"],
        slug: json["slug"],
        salesPersonEmail: json["sales_person_email"],
        salesPersonPhoneNumber: json["sales_person_phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "model": model.toJson(),
        "added_by": addedBy,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "number_plate": numberPlate,
        "year": year,
        "selling_price": sellingPrice,
        "mileage": mileage,
        "color": color,
        "condition": condition,
        "engine_size": engineSize,
        "transmission_type": transmissionType,
        "fuel_type": fuelType,
        "body_type": bodyType,
        "drive_type": driveType,
        "interior": interior,
        "description": description,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "sold": sold,
        "featured": featured,
        "slug": slug,
        "sales_person_email": salesPersonEmail,
        "sales_person_phone_number": salesPersonPhoneNumber,
    };
}




class Feature {
    Feature({
         required this.id,
         required this.name,
    });

    int id;
    String name;

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Model {
    Model({
         required this.id,
         required this.make,
         required this.name,
    });

    int id;
    Feature make;
    String name;

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        make: Feature.fromJson(json["make"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "make": make.toJson(),
        "name": name,
    };
}





