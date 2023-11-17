import 'package:flutter/material.dart';
import 'package:RoadBuddy/adminhome.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';

class taxiCreate extends StatefulWidget {
  const taxiCreate({Key? key});

  @override
  State<taxiCreate> createState() => _taxiCreateState();
}

class _taxiCreateState extends State<taxiCreate> {
  final nameController = TextEditingController();
  final placeController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? selectedVehicleType;
  final List<String> vehicleTypes = ['5seater', '7seater', 'Others'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Taxi')),
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
                          hintText: 'Driver Name',
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
                    child: DropdownButtonFormField<String>(
                      value: selectedVehicleType, // Set the selected value
                      items: vehicleTypes.map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleType =
                              value; // Update the selected value
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Vehicle Type',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a vehicle type';
                        }
                        return null;
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
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Charge per km',
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
    final _phone = phoneController.text.trim();
    final _city = cityController.text.trim();

    if (_name.isEmpty ||
        selectedVehicleType == null ||
        _phone.isEmpty ||
        _city.isEmpty) {
      return;
    }

    final _taxi = TaxiModel(
        name2: _name,
        place1: selectedVehicleType!,
        phone2: _phone,
        city1: _city);
    addTaxi(_taxi);
  }
}
