import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void openGaley() async {
    final imagePicer = ImagePicker();
    final XFile? pickedImage = await imagePicer.pickImage(
        source: ImageSource.gallery, requestFullMetadata: false);
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
    }
  }

  void openCamera() async {
    final imagePicer = ImagePicker();
    final XFile? pickedImage = await imagePicer.pickImage(
        source: ImageSource.camera, requestFullMetadata: false);
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: false,
        title: Text("Home"),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return const ListTile();
          }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () async {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: const Text("Rasim qo'shish"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                            child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Rasim nomi"),
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: openCamera,
                                child: const Text("Rasimga olish")),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                onPressed: openGaley,
                                child: const Text("Galeriya")),
                          ],
                        )
                      ],
                    ),
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
