import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? path;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: size.width,
                    child: Image.asset(
                      'assets/images/cover.jpg',
                      scale: 1.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 20),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        'assets/images/profil.png',
                        scale: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: const TextSpan(
                          text: 'Nom et prénom: ',
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(text: ' ... '),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: const TextSpan(
                          text: 'Age: ',
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(text: ' ...'),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: const TextSpan(
                          text: 'Liste des technologies: ',
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(text: ' ... '),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: const TextSpan(
                          text: 'BMI: ',
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(text: ' ... '),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: const TextSpan(
                          text: 'Loisirs: ',
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(text: ' ... '),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 8, 28, 8),
                child: SizedBox(
                  height: 200,
                  child: path == null
                      ? Image.network(
                          'https://images.pexels.com/photos/3011842/pexels-photo-3011842.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load')
                      : Image.file(File(path!)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
                child: Column(
                  children: [
                    Formulaire(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openGallery();
        },
        child: const Icon(Icons.photo_camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Future<XFile?> pickimage() async {
    final picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }

  Future<String?> openGallery() async {
    final pickedFile = await pickimage();
    if (pickedFile != null) {
      setState(() {
        path = pickedFile.path;
      });
    }
    return null;
  }
}

enum SingingCharacter { m, f }

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nom = "";
  String prenom = "";
  SingingCharacter? _character = SingingCharacter.m;
  double _currentSliderValue = 20;
  bool isChecked1 = false;
  bool isChecked2 = false;
  DateTime _selectedDate = DateTime.now();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nom',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre nom';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Prénom',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre prénom';
                }
                return null;
              },
            ),
          ),
          const Text('Sexe: '),
          ListTile(
            title: const Text('M'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.m,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('F'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.f,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          const Text('Taille: '),
          Slider(
            value: _currentSliderValue,
            max: 250,
            divisions: 5,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Row(
            children: [
              const Text('Techno: '),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked1 = value!;
                      });
                    },
                  ),
                  if (isChecked1) const Text('PHP'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    },
                  ),
                  if (isChecked2) const Text('Flutter'),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Text('Date naissance: '),
              // Bouton pour ouvrir le sélecteur de date
              ElevatedButton(
                onPressed: () {
                  // Appel de la méthode showDatePicker() pour afficher le sélecteur de date
                  _selectDate();
                },
                child: Text(
                  DateFormat("dd/MM/yyyy").format(_selectedDate),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Loisirs',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir vos loisirs';
                }
                return null;
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Valider'),
            ),
          ),
        ],
      ),
    );
  }

  // Méthode pour ouvrir le sélecteur de date
  void _selectDate() async {
    // Date sélectionnée par l'utilisateur
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1920),
      lastDate: DateTime(2100),
    );

    // Mise à jour de la date sélectionnée
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
