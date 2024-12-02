import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:img_ocr_matching/controllers/image_pixel_matching_ctrl.dart';

class ImagePixelMatchingPage extends StatefulWidget {
  const ImagePixelMatchingPage({super.key});

  @override
  State<ImagePixelMatchingPage> createState() => _ImagePixelMatchingPageState();
}

class _ImagePixelMatchingPageState extends State<ImagePixelMatchingPage> {
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ImagePixelMatchingCtrl());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Comparison'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image 1 Picker
                ElevatedButton(
                  onPressed: () => ctrl.pickImage(1),
                  child: const Text('Pick Image 1'),
                ),
                // Image 2 Picker
                ElevatedButton(
                  onPressed: () => ctrl.pickImage(2),
                  child: const Text('Pick Image 2'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Display selected images
            if (ctrl.image1.value != null)
              Image.file(ctrl.image1.value!, width: 150, height: 150),
            if (ctrl.image2.value != null)
              Image.file(ctrl.image2.value!, width: 150, height: 150),
            const SizedBox(height: 20),
            // Compare button
            ElevatedButton(
              onPressed: ctrl.compareImages,
              child: const Text('Compare Images'),
            ),
            const SizedBox(height: 20),
            // Show the similarity score if available
            if (ctrl.similarityScore.value != null)
              Text(
                'Similarity: ${ctrl.similarityScore.value!.toStringAsFixed(2)}%',
                style: const TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
