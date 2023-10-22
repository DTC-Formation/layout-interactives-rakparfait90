import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

void main() {
  runApp(const UserProfile());
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyProfile(),
    );
  }
}

class MyProfile extends StatefulWidget {
  const MyProfile({
    super.key,
  });

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String? pathProfile;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: size.width,
                  child: Image.asset(
                    'assets/images/couverture.jpg',
                    scale: 1.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Container(
                    margin: const EdgeInsets.all(0),
                    color: Colors.black87,
                    width: size.width,
                    height: 60.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 175,
                    left: 20,
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: pathProfile == null
                            ? ClipOval(
                                child: Image.asset(
                                  'assets/images/profil.png',
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              )
                            : ClipOval(
                                child: Image.file(
                                  File(pathProfile!),
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            openGallery();
                          },
                          child: const Icon(
                            Icons.photo_camera,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      width: 140.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          openGallery();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.photo_camera,
                              size: 20.0,
                            ),
                            Text(
                              'Edit cover photo',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              width: size.width,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueGrey,
                    offset: Offset(0, 0.2),
                    blurRadius: 5.5,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 150.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.teal[800],
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0, 0.2),
                          blurRadius: 5.5,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 150.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.amber[800],
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0, 0.2),
                          blurRadius: 5.5,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 150.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.purple[800],
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0, 0.2),
                          blurRadius: 5.5,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Message',
        child: const Icon(Icons.message),
      ),
    );
  }

  Future<XFile?> pickProfileimage() async {
    final picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }

  Future<String?> openGallery() async {
    final pickedProfileImage = await pickProfileimage();
    if (pickedProfileImage != null) {
      final imageCropper = ImageCropper();
      final croppedFile = await imageCropper.cropImage(
        sourcePath: pickedProfileImage.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Recadrer l\'image',
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.ratio16x9,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Recadrer l\'image',
            doneButtonTitle: 'Terminer',
            cancelButtonTitle: 'Annuler',
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          pathProfile = croppedFile.path;
        });
      }
    }

    return null;
  }
}
