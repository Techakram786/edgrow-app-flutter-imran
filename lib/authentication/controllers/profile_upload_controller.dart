import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Imagepickercontroller extends GetxController {
  RxString imagepath = ''.obs;
  Future getCImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagepath.value = image.path.toString();
    }
  }

  Future getGImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagepath.value = image.path.toString();
    }
  }



 
}
