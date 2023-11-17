import 'package:RoadBuddy/insurancedetails.dart';
import 'package:RoadBuddy/main.dart';
import 'package:RoadBuddy/userhomenew.dart';
import 'package:flutter/material.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';
import 'package:RoadBuddy/login.dart';
import 'package:intl/intl.dart';

class Insurance extends StatefulWidget {
  final String userId;
  final String name;
  const Insurance({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  final namecontroller = TextEditingController();
  final typecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final modelcontroller = TextEditingController();
  final fromdatecontroller = TextEditingController();
  final todatecontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Insurance Details',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
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
                          hintText: 'Name of insured',
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
                      controller: typecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Insurance type',
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
                        hintText: 'Contact',
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
                      controller: modelcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Vehicle model',
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
                  Text('Period of Insurance',
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: fromdatecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Date From dd-MM-yyyy',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Value empty';
                        }

                        final DateFormat format = DateFormat('dd-MM-yyyy');
                        try {
                          final toDate = format.parseStrict(value);
                          final fromDate =
                              format.parseStrict(fromdatecontroller.text);

                          if (fromDate.isAfter(toDate)) {
                            return 'From date cannot be later than To date';
                          }
                        } catch (e) {
                          return 'Invalid date format (dd-MM-yyyy)';
                        }

                        return null;
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: todatecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Date Upto dd-MM-yyyy',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Value empty';
                        }

                        final DateFormat format = DateFormat('dd-MM-yyyy');
                        try {
                          final toDate = format.parseStrict(value);
                          final fromDate =
                              format.parseStrict(fromdatecontroller.text);

                          if (fromDate.isAfter(toDate)) {
                            return 'From date cannot be later than To date';
                          }
                        } catch (e) {
                          return 'Invalid date format (dd-MM-yyyy)';
                        }

                        return null;
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
                                            builder: (ctx) => Homescreennew(
                                                  userId: widget.userId,
                                                  name: widget.name,
                                                )),
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
    final _type = typecontroller.text.trim();
    final _phone = phonecontroller.text.trim();
    final _model = modelcontroller.text.trim();
    final _fromdate = fromdatecontroller.text.trim();
    final _todate = todatecontroller.text.trim();
    if (_name.isEmpty ||
        _type.isEmpty ||
        _phone.isEmpty ||
        _model.isEmpty ||
        _fromdate.isEmpty ||
        _todate.isEmpty) {
      return;
    }
    final _insrc = InsuranceModel(
        name2: _name,
        type: _type,
        phone2: _phone,
        model: _model,
        fromdate: _fromdate,
        todate: _todate,
        userid: widget.userId);
    addinsurance(_insrc);
  }
}
