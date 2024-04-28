

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';


class PdfUploadController extends GetxController {
  Rx<FilePickerResult?> selectedPdf = Rx<FilePickerResult?>(null);





  Future<void> pickAndUploadPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      selectedPdf.value = result;
    }
  }


}


