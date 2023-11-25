import 'dart:io';
import 'package:flutter/material.dart';
import 'package:RoadBuddy/addvehicledetails.dart';
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
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
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
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: vhcllist.length,
                    itemBuilder: (ctx, index) {
                      final data = vhcllist[index];

                      // Check if the userId matches before displaying the details
                      if (data.userid == widget.userId) {
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
                            margin: EdgeInsets.all(8),
                          ),
                        );
                      } else {
                        // If userId doesn't match, return an empty container
                        return Container();
                      }
                    },
                  );
                },
              )

              /* ValueListenableBuilder(
              valueListenable: Vehiclelistnotifier,
              builder: (BuildContext ctx, List<VehicleModel> vhcllist, Widget? child) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: vhcllist.length,
                  itemBuilder: (ctx, index) {
                    final data = vhcllist[index];
                    final String assetPath = data.imagePath; // Assuming image field represents the asset path.
                    final String name = data.name2;

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FullScreenImage(imagePath: assetPath),
                        ));
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              assetPath, // Display the image asset.
                              width: 100, // Adjust width as needed.
                              height: 100, // Adjust height as needed.
                            ),
                            Text(name),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),*/
              ),
        ),
      ),
    );
  }
}
