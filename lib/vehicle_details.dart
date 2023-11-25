import 'dart:io';
import 'package:flutter/material.dart';
import 'package:RoadBuddy/add_vehicle_details.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';
import 'package:RoadBuddy/image.dart';

class VehicleDetails extends StatefulWidget {
  final String userId;
  final String name;
  const VehicleDetails({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

Widget _buildImageWidget(VehicleModel student,
    {double width = 80, double height = 80}) {
  if (student.imagePath != null && student.imagePath.isNotEmpty) {
    return Image.file(
      File(student.imagePath),
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  } else {
    return Image.asset(
      'assets/images/battery.jpg',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}

class _VehicleDetailsState extends State<VehicleDetails> {
  @override
  Widget build(BuildContext context) {
    getvehicle();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vehicle Details',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (ctx1) => DocumentAdd(
                              userId: widget.userId,
                              name: widget.name,
                            )),
                  );
                },
                icon: const Icon(Icons.add_a_photo),
              ),
              const Text('Add Document'),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ValueListenableBuilder(
              valueListenable: Vehiclelistnotifier,
              builder: (BuildContext ctx, List<VehicleModel> vhcllist,
                  Widget? child) {
                // Filter the list based on userId
                final filteredList =
                    vhcllist.where((data) => data.userid == widget.userId).toList();

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: filteredList.length,
                  itemBuilder: (ctx, index) {
                    final data = filteredList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              FullScreenImage(imagePath: data.imagePath),
                        ));
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildImageWidget(data),
                            const SizedBox(height: 8),
                            Text(data.name2),
                          ],
                        ),
                        elevation: 4,
                        margin: const EdgeInsets.all(8),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
