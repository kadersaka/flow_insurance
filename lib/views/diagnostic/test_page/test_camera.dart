import 'package:flutter/material.dart';

class CameraTest extends StatefulWidget {
  const CameraTest({super.key});

  @override
  State<CameraTest> createState() => _CameraTestState();
}

class _CameraTestState extends State<CameraTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[

        ]
      ),
    );
  }

  // void pickImage() async {
  //   ImagePicker imagePicker = ImagePicker();
  //   XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     pathOfImage = image!.path;
  //   });
  // }

  // void extractData(String imagePath) async {
  //   final inputImage = InputImage.fromFilePath(imagePath);
  //   List<Face> faces = await detector.processImage(inputImage);
  //   setState(() {
  //     detectedfaces=faces;
  //   });
  // }
}