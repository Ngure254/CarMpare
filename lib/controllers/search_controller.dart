import 'package:car_list/models/model_model.dart';
import 'package:car_list/models/vehicle_model.dart';
import 'package:get/get.dart';
import 'package:car_list/constants/controllers.dart';

class AppController extends GetxController {
  static AppController get instance => Get.find();

  Rx<Result>? car;
  Rx<ModelModel>? model;
  Rx<Make>? make;

  final currentImage = 0.obs;

  setCar(Result _car) {
    car = _car.obs;
  }

  setModel(ModelModel _model) {
    model = _model.obs;
  }

  setMake(Make _make) {
    make = _make.obs;
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
