import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyfe/screens/home/home_page.dart';
import 'package:fyfe/widgets/palette.dart';
import 'package:fyfe/widgets/step_indicator.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddPropertyImage extends StatefulWidget {
  final uuid;
  const AddPropertyImage({super.key, required this.uuid});

  @override
  State<AddPropertyImage> createState() => _AddPropertyImageState();
}

class _AddPropertyImageState extends State<AddPropertyImage> {
  bool uploading = false;
  double val = 0;
  CollectionReference? imgRef;
  firebase_storage.Reference? ref;

  List<File> _image = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color(
          0xff3AC1CD,
        ),
        elevation: 0,
        title: const Text(
          "Add Photo",
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
            Color(
              0xff3AC1CD,
            ),
            Color(
              0xff3AC1CD,
            ),
            Color(
              0xff3AADC6,
            ),
            Color(
              0xff395CAA,
            )
          ], radius: 1.8, center: Alignment.topCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20.0,
            20.0,
            20.0,
            0.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              StepIndicator(selected: 2),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: GridView.builder(
                      itemCount: _image.length + 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        print(widget.uuid);
                        return index == 0
                            ? Center(
                                child: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () =>
                                        !uploading ? chooseImage() : null),
                              )
                            : Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: FileImage(_image[index - 1]),
                                        fit: BoxFit.cover)),
                              );
                      }),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (_image.length <= 6) {
                      setState(() {
                        uploading = true;
                      });
                      uploadFile().whenComplete(() => Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => HomePage())));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.blue,
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: uploading
                      ? Center(
                          child: CircularProgressIndicator(
                            value: val,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                        )
                      : Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w700),
                        ),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
            ],
          ),
        ),
      )),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref!.putFile(img).whenComplete(() async {
        await ref!.getDownloadURL().then((value) {
          FirebaseFirestore.instance
              .collection('property')
              .doc(widget.uuid)
              .update({
            'photo': FieldValue.arrayUnion([value])
          });
          // imgRef!.add({'url': value});
          i++;
        });
      });
    }
  }
}
