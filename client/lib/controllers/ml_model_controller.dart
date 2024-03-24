import 'package:get/get.dart';

import '../repository/ml_model_repository.dart';

class MlModelController extends GetxController {
  final RxList<String> _predictedModules = <String>[].obs;

  List<String> get predictedModules => _predictedModules;

  Future<void> getModules(String content) async {
    List<String>? newPredictedModules =
        await MlModelRepository().getPredictedModuleNames(content);
    if (newPredictedModules != null) {
      _predictedModules.assignAll(newPredictedModules);
    }
  }
}