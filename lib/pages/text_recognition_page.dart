import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:img_ocr_matching/controllers/text_recognition_ctrl.dart';

class TextRecognitionPage extends StatefulWidget {
  const TextRecognitionPage({super.key});

  @override
  State<TextRecognitionPage> createState() => _TextRecognitionPageState();
}

class _TextRecognitionPageState extends State<TextRecognitionPage> {
  final ctrl = Get.put(TextRecognitionCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Text Recognition"),
      ),
      body: Obx(
        () => ctrl.selectedImage.value != null
            ? SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.file(
                        ctrl.selectedImage.value!,
                        width: 200,
                      ),
                    ),
                    FutureBuilder(
                      future: ctrl.extractText(),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data != null
                              ? snapshot.data!.isNotEmpty
                                  ? snapshot.data!
                                  : "No English Text Found"
                              : "No English Text Found",
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            : const Center(
                child: Text("Pick an Image for Text Recognization"),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ctrl.selectMediaFile,
        child: const Icon(Icons.add),
      ),
    );
  }
}
