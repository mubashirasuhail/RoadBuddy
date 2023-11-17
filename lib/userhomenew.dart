import 'package:RoadBuddy/aboutus.dart';
import 'package:RoadBuddy/insurance.dart';
import 'package:RoadBuddy/insurancedetails.dart';
import 'package:RoadBuddy/sand.dart';
import 'package:RoadBuddy/vehicledetails.dart';
import 'package:flutter/material.dart';
import 'package:RoadBuddy/Towing.dart';
import 'package:RoadBuddy/battery.dart';
import 'package:RoadBuddy/login.dart';
import 'package:RoadBuddy/myRequest.dart';

import 'package:RoadBuddy/userservicestation.dart';

class Homescreennew extends StatefulWidget {
  final String userId;
  final String name;
  const Homescreennew({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  State<Homescreennew> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreennew> {
  List<ListItem> items = [
    ListItem('Towing Service', 'assets/towing1.jpg'),
    ListItem('Battery Jumpstart', 'assets/battery1.jpg'),
    ListItem('Sand Pullout', 'assets/sand1.jpg'),
    ListItem('Vehicle Details', 'assets/vehicle1.png'),
    ListItem('Insurance Details', 'assets/insurance1.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(
                  'assets/person.jpg'), // Replace with the actual path to your avatar image
            ),
            const SizedBox(width: 8),
            Text(
              widget.name, // Use widget.name here
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx1) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              signout(context);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.exit_to_app),
              ),
              const Text('Logout'), // Add this line for the "Logout" text
            ],
          ),
        ],
      ),
      drawer: buildDrawer(),
      // bottomNavigationBar: const BottomNavigation(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/back2.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx1) => TowingRequest(
                              userId: widget.userId, name: widget.name)),
                    );
                  } else if (index == 1) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx1) => batteryJumb(
                              userId: widget.userId, name: widget.name)),
                    );
                  } else if (index == 2) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx1) => SandRequest(
                              userId: widget.userId, name: widget.name)),
                    );
                  } else if (index == 3) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx1) => VehicleDetails(
                              userId: widget.userId, name: widget.name)),
                    );
                  } else if (index == 4) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx1) => InsuranceDetails(
                            userId: widget.userId, name: widget.name)));
                  }
                },
                child: Container(
                  width: 100, // Make the container full width
                  height: 100,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // Round the image
                                child: Image.asset(
                                  items[index].imageUrl,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 50, // Adjust spacing as needed
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            items[index].name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.all(10),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
          ),
          child: Center(
            child: Text(
              'Road Buddy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.request_page),
          title: Text('My Request'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (ctx1) => myRequest(
                        userId: widget.userId,
                        name: widget.name,
                      )),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.car_rental),
          title: Text('Add Vehicle Details'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (ctx1) =>
                      VehicleDetails(userId: widget.userId, name: widget.name)),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Add Insurance Details'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (ctx1) => InsuranceDetails(
                      userId: widget.userId, name: widget.name)),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.request_page),
          title: Text('Service Station'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx1) => const servicestation2()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.account_box_outlined),
          title: Text('About Us'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx1) => AboutRoadBuddyPage()),
            );
          },
        ),
      ],
    ));
  }
}

signout(BuildContext ctx) async {
  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => Loginscreen()), (route) => false);
}

class ListItem {
  final String name;
  final String imageUrl;
  ListItem(this.name, this.imageUrl);
}
