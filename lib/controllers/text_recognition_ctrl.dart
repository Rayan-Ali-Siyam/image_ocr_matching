import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class TextRecognitionCtrl extends GetxController {
  Rxn<File?> selectedImage = Rxn<File>();

  selectMediaFile() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  Future<String?> extractText() async {
    final textRecognizer = TextRecognizer();

    final InputImage inputImage = InputImage.fromFile(selectedImage.value!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    textRecognizer.close();

    return recognizedText.text;
  }
}
