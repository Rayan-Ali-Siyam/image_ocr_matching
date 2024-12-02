import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:img_ocr_matching/pages/image_pixel_matching_page.dart';
import 'package:img_ocr_matching/pages/text_recognition_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(
                () => const TextRecognitionPage(),
              ),
              child: const Text("Text Recognition"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(
                () => const ImagePixelMatchingPage(),
              ),
              child: const Text("Image Matching"),
            ),
          ],
        ),
      ),
    );
  }
}
