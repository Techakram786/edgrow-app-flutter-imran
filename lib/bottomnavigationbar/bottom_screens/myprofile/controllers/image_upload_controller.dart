import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadController extends GetxController {
  RxString imagePath = ''.obs;
  Future getCImage(ImageSource camera) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future getGImage(ImageSource gallery) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
