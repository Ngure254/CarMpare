import 'dart:convert';

import 'package:car_list/models/image_model.dart' ;
import 'package:car_list/models/model_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:car_list/models/vehicle_model.dart' hide Model;

class VehicleController extends GetxController {
  static VehicleController instance = Get.find();


  Future<VehicleModel> getVehicles(int page) async {
    var client = http.Client();
    var vehicles;
    try {
      var responce = await client.get(Uri.parse(
          'https://gigi-api-bvxtqx2c3a-uc.a.run.app/api/v1/vehicles/?format=json&page=' +
              page.toString()));/
      if (responce.statusCode == 200) {
        var jsonData = jsonDecode(responce.body);
        vehicles = VehicleModel.fromJson(jsonData);
      }
      return vehicles;
    } catch (e) {
      return vehicles;
    }
  }

  Future<ImageModel> getImage(String slug) async {
    var client = http.Client();
    var image;
    try {
      var responce = await client.get(Uri.parse(
          'https://gigi-api-bvxtqx2c3a-uc.a.run.app/api/v1/vehicle-images/?format=json&vehicle__slug=' +
              slug));
      if (responce.statusCode == 200) {
        var jsonData = jsonDecode(responce.body);
        image = ImageModel.fromJson(jsonData[0]);
      }
      return image;
    } catch (e) {
      return image;
    }
  }

  Future<List<ImageModel>> getImages(String slug) async {
    var client = http.Client();
    List<ImageModel> images = [];
    try {
      var responce = await client.get(Uri.parse(
          'https://gigi-api-bvxtqx2c3a-uc.a.run.app/api/v1/vehicle-images/?format=json&vehicle__slug=' +
              slug));
      if (responce.statusCode == 200) {
        var jsonData = jsonDecode(responce.body);
        for (var i in jsonData) {
          images.add(ImageModel.fromJson(i));
        }
      }
      return images;
    } catch (e) {
      return images;
    }
  }

  List<Future<ImageModel>> getImageList(VehicleModel vehicleModel) {
    var cars = vehicleModel.results;
    List<Future<ImageModel>> list = [];

    cars.forEach((car) {
      var img = getImage(car.slug);
      list.add(img);
    });
    return list;
  }

  Future<dynamic> getByTypes(String page) async {
    var responce = await http.get(Uri.parse(
        'https://gigi-api-bvxtqx2c3a-uc.a.run.app/api/v1/vehicles/?format=api&page=1'));
    var jsonData = jsonDecode(responce.body);
    return jsonData;
  }

  Future<dynamic> getBySearch(String page) async {
    var responce = await http.get(Uri.parse(
        'https://gigi-api-bvxtqx2c3a-uc.a.run.app/api/v1/vehicles/?format=api&page=1'));
    var jsonData = jsonDecode(responce.body);
    return jsonData;
  }

  Future<List<ModelModel>> getModels(int page) async {
    var client = http.Client();
    List<ModelModel> models = [];
    try {
      var responce = await client.get(Uri.parse(
          'https://gigi-api-bvxtqx2c3a-uc.a.run.app/api/v1/vehicle-models/?format=json&make='+page.toString()));
      if (responce.statusCode == 200) {
        var jsonData = jsonDecode(responce.body);
        for (var i in jsonData) {
          models.add(ModelModel.fromJson(i));
        }
      }
      return models;
    } catch (e) {
      return models;
    }
  }

  Future<List<Make>> getMake() async {
    var client = http.Client();
    List<Make> makes = [];
    try {
      var responce = await client.get(Uri.parse(
          'https://gigi-api-bvxtqx2c3a-uc.a.run.app/api/v1/vehicle-makes/?format=json'));
      if (responce.statusCode == 200) {
        var jsonData = jsonDecode(responce.body);
        for (var i in jsonData) {
          makes.add(Make.fromJson(i));
        }
      }
      return makes;
    } catch (e) {
      return makes;
    }
  }


}