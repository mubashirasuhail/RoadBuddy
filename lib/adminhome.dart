import 'package:RoadBuddy/userdetails.dart';
import 'package:flutter/material.dart';
import 'package:RoadBuddy/Restaurant.dart';
import 'package:RoadBuddy/Taxi.dart';
import 'package:RoadBuddy/accept.dart';

import 'package:RoadBuddy/login.dart';
import 'package:RoadBuddy/servicestation.dart';

class Adminscreen extends StatefulWidget {
  const Adminscreen({Key? key}) : super(key: key);

  @override
  State<Adminscreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<Adminscreen> {
  // Define a list of items to display on the admin screen.
  List<ListItem> items = [
    ListItem('Users', 'assets/users.jpg'),
    //  ListItem('Add Service Charge', 'assets/money.jpg'),
    ListItem('Accept Service Request', 'assets/accept.png'),
    ListItem('Add Service Station', 'assets/servicestation.jpg'),
    ListItem('Add Taxi', 'assets/taxi.jpg'),
    ListItem('Add Restaurant', 'assets/res.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Show a logout dialog and sign out when confirmed.
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
        ],
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
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx1) => const UserDetails()),
                    );
                  }
                  /*  else if (index == 1) {
                    // Navigate to the appropriate page for 'Add service charge'
                  }*/
                  else if (index == 1) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx1) => const acceptRequset()),
                    );
                  } else if (index == 2) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx1) => const servicestation1()),
                    );
                  } else if (index == 3) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx1) => const Taxi()),
                    );
                  } else if (index == 4) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx1) => const Restaurant()),
                    );
                  }
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            items[index].imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          items[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.all(11),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // A function to handle the signout process.
  void signout(BuildContext ctx) async {
    // You can add your signout logic here.
    // For example, clearing shared preferences.

    // Navigate to the Login screen and remove the current screen from the navigation stack.
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => Loginscreen()),
      (route) => false,
    );
  }
}

class ListItem {
  final String name;
  final String imageUrl;

  ListItem(this.name, this.imageUrl);
}

void main() {
  runApp(MaterialApp(
    home: Adminscreen(),
  ));
}
