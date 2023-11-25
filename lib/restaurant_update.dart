import 'package:flutter/material.dart';
import 'package:RoadBuddy/Restaurant.dart';
import 'package:RoadBuddy/taxi.dart';
import 'package:RoadBuddy/db/dbfunction.dart';
import 'package:RoadBuddy/service_station.dart';

class restaurantUpdate extends StatefulWidget {
  final String name1;
  final String place;
  final int? id;

  final String phone1;
  final String city;
  restaurantUpdate(
      {super.key,
      required this.name1,
      required this.place,
      required this.id,
      required this.phone1,
      required this.city});

  @override
  State<restaurantUpdate> createState() => _restaurantUpdateState();
}

class _restaurantUpdateState extends State<restaurantUpdate> {
  late TextEditingController namecontroller =
      TextEditingController(text: widget.name1);

  late TextEditingController placecontroller =
      TextEditingController(text: widget.place);

  late TextEditingController phonecontroller =
      TextEditingController(text: widget.phone1);

  late TextEditingController citycontroller =
      TextEditingController(text: widget.city);

  final _formKey = GlobalKey<FormState>();

  void initState() {
    // Initialize divcontroller with the value of 'div'
    namecontroller = TextEditingController(text: widget.name1);
    placecontroller = TextEditingController(text: widget.place);
    phonecontroller = TextEditingController(text: widget.phone1);
    citycontroller = TextEditingController(text: widget.city);
  }

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
                          hintText: 'Restaurant Name',
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
                      controller: placecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Type of Food',
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
                                        String newName = namecontroller.text
                                            .trim(); // Get new name
                                        String newplace = placecontroller.text
                                            .trim(); // Get new age
                                        String newphone = phonecontroller.text
                                            .trim(); // Get new class/div (assuming it's not editable)
                                        String newcity = citycontroller.text
                                            .trim(); // Get new roll number (assuming it's not editable)

                                        updateRestaurant(
                                            newName,
                                            newplace,
                                            newphone,
                                            newcity,
                                            widget
                                                .id!); // Pass new values and the student's ID
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        Restaurant()),
                                                (route) => false);
                                      },
                                      child: const Text('yes'),
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
}
