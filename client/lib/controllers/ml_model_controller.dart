import 'package:get/get.dart';

import '../repository/ml_model_repository.dart';

class MlModelController extends GetxController{

  List<String> _predictedModules = List.empty(growable: true);
  List<String> get predictedModules => _predictedModules;

  Future<void> getModules(String content) async {
    _predictedModules = await MlModelRepository().getPredictedModuleNames(content) ?? [];
    update();
  }
}