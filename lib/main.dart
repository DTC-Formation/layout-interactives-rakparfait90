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
  String? pathCover;
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
                // Photo de couverture
                SizedBox(
                  height: 200,
                  width: size.width,
                  child: pathCover == null
                      ? Image.asset(
                          'assets/images/couverture.jpg',
                          scale: 1.0,
                          fit: BoxFit.cover,
                          width: size.width,
                          height: 100,
                        )
                      : Image.file(
                          File(pathCover!),
                          fit: BoxFit.cover,
                          width: size.width,
                          height: 100,
                        ),
                ),
                // Infos perso
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(0),
                        width: size.width,
                        height: 210.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, left: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "RABEANARANA fanampiny",
                              style: TextStyle(fontSize: 24.0),
                            ),
                            const Text(
                              "Profil . Créateur digitale",
                              style: TextStyle(fontSize: 12.0),
                            ),
                            const Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '952',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: ' Followers',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' . ',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '52',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: ' Suivie(s) ',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(right: 2.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/profil.png',
                                        scale: 1.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(right: 2.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/profil.png',
                                        scale: 1.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(right: 2.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/profil.png',
                                        scale: 1.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(right: 2.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/profil.png',
                                        scale: 1.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(right: 2.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/profil.png',
                                        scale: 1.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(right: 2.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/profil.png',
                                        scale: 1.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      fixedSize: const Size(120.0, 20.0),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Ajouter à story',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 8, left: 8),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        fixedSize: const Size(150.0, 20.0),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Voir le tableau de bord',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      fixedSize: const Size(20.0, 20.0),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      '..',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Photo de profil
                Padding(
                  padding: const EdgeInsets.only(
                    top: 125,
                    left: 20,
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: pathProfile == null
                            ? Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors
                                        .white, // Couleur de la bordure blanche
                                    width: 2.0, // Largeur de la bordure
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/profil.png',
                                    scale: 1.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors
                                        .white, // Couleur de la bordure blanche
                                    width: 2.0, // Largeur de la bordure
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.file(
                                    File(pathProfile!),
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                      ),
                      // Bouton manova photo de profil
                      Padding(
                        padding: const EdgeInsets.only(top: 55, left: 60),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {
                            chooseProfileImage();
                          },
                          child: const Icon(
                            Icons.photo_camera,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Bouton manova photo de couverture
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      width: 140.0,
                      height: 40.0,
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
                          chooseCoverImage();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.photo_camera,
                              size: 24.0,
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
              margin: const EdgeInsets.only(top: 20),
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
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

  Future<String?> chooseProfileImage() async {
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

  Future<XFile?> pickCoverimage() async {
    final picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }

  Future<String?> chooseCoverImage() async {
    final pickedProfileImage = await pickCoverimage();
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
          pathCover = croppedFile.path;
        });
      }
    }

    return null;
  }
}
