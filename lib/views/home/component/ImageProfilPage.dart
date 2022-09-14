import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ImageProfilPage extends StatefulWidget {
  File? ImageFile;
  final Function(File?) fun;
  ImageProfilPage({super.key, required this.ImageFile, required this.fun});

  @override
  State<ImageProfilPage> createState() => _ImageProfilPageState(ImageFile, fun);
}

class _ImageProfilPageState extends State<ImageProfilPage> {
  _ImageProfilPageState(this.imageFile, this.fun);
  File? imageFile;
  final Function(File?) fun;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: Colors.black)),
        //title: const Text("Recharger", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 230, top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        radius: 40,
                        child: ClipOval(
                          child: imageFile != null
                              ? Image.file(
                                  imageFile!,
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(CupertinoIcons.person_crop_circle_fill),
                        ),
                      ),
                    ),
                  ),
                  sButton(),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                width: MediaQuery.of(context).size.width * 7 / 10,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
                    onPressed: () {
                      fun(imageFile);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Sauvegarder",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
          ],
        ),
      ),
    );
  }

  Widget sButton() {
    return TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)),
          side: MaterialStateProperty.all<BorderSide>(const BorderSide(width: 2.0, color: Color.fromARGB(255, 78, 71, 71))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          getFile();
        },
        child: Container(
          height: 20,
          width: MediaQuery.of(context).size.width * 4 / 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.camera_alt, color: Color.fromARGB(255, 78, 71, 71)),
              Text(" Ajouter un logo", style: TextStyle(color: Color.fromARGB(255, 78, 71, 71))),
            ],
          ),
        ));
  }

  void getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);
    if (result != null) {
      setState(() {
        imageFile = File(result.paths[0]!);
      });
    }
  }
}
