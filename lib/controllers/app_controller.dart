import 'package:car_list/models/model_model.dart';
import 'package:car_list/models/vehicle_model.dart';
import 'package:get/get.dart';
import 'package:car_list/constants/controllers.dart';

class AppController extends GetxController {
  static AppController get instance => Get.find();

  Rx<Result>?
      car; //  Result(id: 0,model: Model(id: 0,make: Feature(id: 0 , name: ''), name: ''), addedBy: 'addedBy', features: [], numberPlate: 'numberPlate', year: 0, sellingPrice: 0, mileage: 0, color: 'color', condition: 'condition', engineSize: 'engineSize', transmissionType: 'transmissionType', fuelType: 'fuelType', bodyType: 'bodyType', driveType: 'driveType', interior: 'interior', description: 'description', created: DateTime.now(), updated: DateTime.now(), sold: false, featured: false, slug: 'slug', salesPersonEmail: 'salesPersonEmail', salesPersonPhoneNumber: 'salesPersonPhoneNumber').obs;

  final currentImage = 0.obs;

  setCar(Result _car) {
    car = _car.obs;
  }
}
