import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldControllerLogic extends GetxController {
  var textControllers = <TextEditingController>[].obs;

  void addTextField() {
    textControllers.add(TextEditingController());
  }
 void remvoeText(index) {
    textControllers.removeAt(index);
  }

@override
  void onInit() {
    
    textControllers.add(TextEditingController());
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose of the text controllers when the controller is closed
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.onClose();
  }
}

// class TextController extends GetxController {
//   TextEditingController textEditingController = TextEditingController();
// }
