import 'dart:io';

import 'package:flutter_pixelmatching/flutter_pixelmatching.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePixelMatchingCtrl extends GetxController {
  Rxn<File?> image1 = Rxn<File>();
  Rxn<File?> image2 = Rxn<File>();
  RxnDouble similarityScore = RxnDouble();
  final ImagePicker picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> pickImage(int imageNumber) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (imageNumber == 1) {
        image1.value = File(image.path);
      } else if (imageNumber == 2) {
        image2.value = File(image.path);
      }
    }
  }

  // Function to compare the two selected images
  Future<void> compareImages() async {
    if (image1.value != null && image2.value != null) {
      // final result = await PixelMatching.match(image1!, image2!);

      // setState(() {
      //   similarityScore = result.similarityPercentage;
      // });
      final matching = PixelMatching();
// setup target image
      final image1Unit8List = await image1.value!.readAsBytes();
      await matching.initialize(image: image1Unit8List);
// compare image
      final image2Unit8List = await image2.value!.readAsBytes();
      final double? similarity = await matching.similarity(image2Unit8List);

      // setState(() {
      similarityScore.value = similarity ?? 0;
      // });
    }
  }
}
