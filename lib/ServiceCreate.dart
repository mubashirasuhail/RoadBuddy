import 'package:flutter/material.dart';
import 'package:RoadBuddy/adminhome.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';

class ServiceCreate extends StatefulWidget {
  const ServiceCreate({Key? key});

  @override
  State<ServiceCreate> createState() => _ServiceCreateState();
}

class _ServiceCreateState extends State<ServiceCreate> {
  final nameController = TextEditingController();
  final placeController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Service Station')),
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
              key: _formKey,
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
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Value empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: placeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Place',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Value empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Phone Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Value empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'City',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Value empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          onAddButton();
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
                                              builder: (ctx) => Adminscreen()),
                                          (route) => false);
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

  Future<void> onAddButton() async {
    final _name = nameController.text.trim();
    final _place = placeController.text.trim();
    final _phone = phoneController.text.trim();
    final _city = cityController.text.trim();
    if (_name.isEmpty || _place.isEmpty || _phone.isEmpty || _city.isEmpty) {
      return;
    }
    final _service =
        ServiceModel(name1: _name, place: _place, phone1: _phone, city: _city);
    addServicestation(_service);
  }
}
