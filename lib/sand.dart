import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:RoadBuddy/Requeststatus.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';
import 'package:intl/intl.dart';

class SandRequest extends StatefulWidget {
  final String userId;
  final String name;

  const SandRequest({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  State<SandRequest> createState() => _SandRequestState();
}

class _SandRequestState extends State<SandRequest> {
  final locationController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String currentLocation = '';
  String currentDateTime = '';
  bool hasLocationPermission = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sand Pullout Request')),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: locationController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Location',
                                prefixIcon: InkWell(
                                  onTap: () {
                                    getLocation();
                                  },
                                  child: Icon(Icons.location_on_outlined),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Empty Location';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Date:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        ' $currentDateTime',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Payment Amount:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        ' ₹100',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Tax Amount:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        ' ₹10',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Total Amount:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        ' ₹110',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          onAddbutton(currentDateTime);
                          showDialog(
                            context: context,
                            builder: (ctx1) {
                              return AlertDialog(
                                title: const Text('Request send'),
                                content: const Text('Your request send'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx1) => requestStatus(
                                              userId: widget.userId,
                                              name: widget.name),
                                        ),
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
                      child: const Text('Send Request'),
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
    requestLocationPermission();
    getLocation();
    final now = DateTime.now();
    currentDateTime = DateFormat('dd-MMMM-yyyy h:mm a').format(now);
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      setState(() {
        hasLocationPermission = true;
      });
    } else if (status.isDenied) {
      // Handle denied permission here.
    }
  }

  Future<void> onAddbutton(String currentDate) async {
    final _location = locationController.text.trim();
    final _servicetype = 'Sand Pullout';
    final _date = currentDate;
    final _type = 'Request';
    final _amount = '110';

    if (_location.isEmpty ||
        _servicetype.isEmpty ||
        _date.isEmpty ||
        _type.isEmpty ||
        _amount.isEmpty) {
      return;
    }
    final _user = servicetypeModel(
        location: _location,
        servicetype: _servicetype,
        date: _date,
        type: _type,
        amount: _amount,
        userid: widget.userId);
    addservicetype(_user);
  }

  Future<void> getLocation() async {
    if (hasLocationPermission) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks[0];
          String currentAddress = placemark.thoroughfare ?? '';
          setState(() {
            currentLocation = currentAddress;
            locationController.text = currentLocation; // Set text field value
          });
        }
      } catch (e) {
        print('Error getting location: $e');
      }
    } else {}
  }
}
