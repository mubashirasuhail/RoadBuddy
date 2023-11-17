import 'package:RoadBuddy/adminhome.dart';
import 'package:RoadBuddy/vehicledetails.dart';
import 'package:flutter/material.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';
import 'package:RoadBuddy/login.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class DocumentAdd extends StatefulWidget {
  final String userId;
  final String name;
  const DocumentAdd({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  State<DocumentAdd> createState() => _DocumentAddState();
}

class _DocumentAddState extends State<DocumentAdd> {
  final namecontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  File? _selectedImage;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add details')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/back2.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: namecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Value is empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  // Add Document Type Field

                  const SizedBox(
                    height: 20,
                  ),
                  // Image Picker Button and Preview
                  ElevatedButton(
                    onPressed: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        setState(() {
                          _selectedImage = File(image.path);
                        });
                      }
                    },
                    child: const Text('Select Image'),
                  ),
                  if (_selectedImage != null)
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.file(
                        _selectedImage!,
                        width: 50, // Set your desired width
                        height: 50, // Set your desired height
                      ),
                    ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          onAddbutton();
                          showDialog(
                            context: context,
                            builder: (ctx1) {
                              return AlertDialog(
                                title: const Text('Data saved'),
                                content: const Text('Data saved successfully'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (ctx) => VehicleDetails(
                                                userId: widget.userId,
                                                name: widget.name)),
                                        (route) => false,
                                      );
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          print('Data empty');
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddbutton() async {
    final _name = namecontroller.text.trim();
    String imagePath = '';

    if (_selectedImage != null) {
      imagePath = _selectedImage!.path;
    }

    final _user =
        VehicleModel(name2: _name, imagePath: imagePath, userid: widget.userId);
    addvehicledetails(_user);
  }
}
