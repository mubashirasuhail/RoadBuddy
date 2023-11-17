import 'package:flutter/material.dart';
import 'package:RoadBuddy/Taxi.dart';
import 'package:RoadBuddy/db/dbfunction.dart';
import 'package:RoadBuddy/servicestation.dart';

class Taxiupdate extends StatefulWidget {
  final String name1;
  final String place;
  final int? id;

  final String phone1;
  final String city;
  Taxiupdate(
      {super.key,
      required this.name1,
      required this.place,
      required this.id,
      required this.phone1,
      required this.city});

  @override
  State<Taxiupdate> createState() => _TaxiupdateState();
}

class _TaxiupdateState extends State<Taxiupdate> {
  late TextEditingController namecontroller =
      TextEditingController(text: widget.name1);

  late TextEditingController placecontroller =
      TextEditingController(text: widget.place);

  late TextEditingController phonecontroller =
      TextEditingController(text: widget.phone1);

  late TextEditingController citycontroller =
      TextEditingController(text: widget.city);

  final _formKey = GlobalKey<FormState>();
  String? selectedVehicleType;
  final List<String> vehicleTypes = ['5seater', '7seater', 'Others'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name1)),
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
                        controller: namecontroller,
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
                      value: selectedVehicleType,
                      items: vehicleTypes.map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleType = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Type of vehicle',
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
                      controller: phonecontroller,
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
                      controller: citycontroller,
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
                          showDialog(
                              context: context,
                              builder: (ctx1) {
                                return AlertDialog(
                                  title: const Text('Update'),
                                  content: const Text(
                                      'Do you want update this item'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx1).pop();
                                      },
                                      child: const Text('close'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        String newName =
                                            namecontroller.text.trim();
                                        String newPhone =
                                            phonecontroller.text.trim();
                                        String newCity =
                                            citycontroller.text.trim();
                                        updateTaxi(
                                            newName,
                                            selectedVehicleType!,
                                            newPhone,
                                            newCity,
                                            widget.id!);
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (ctx) => Taxi()),
                                                (route) => false);
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                );
                              });
                        } else {
                          print('Data empty');
                        }
                      },
                      child: const Text('Update'),
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

  void initState() {
    super.initState();

    namecontroller = TextEditingController(text: widget.name1);
    placecontroller = TextEditingController(text: widget.place);
    phonecontroller = TextEditingController(text: widget.phone1);
    citycontroller = TextEditingController(text: widget.city);

    // Set selectedVehicleType based on the value from the database
    selectedVehicleType = widget.place;
  }
}
