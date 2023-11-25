import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';

class restaurantUser extends StatelessWidget {
  const restaurantUser({super.key});

  // bool _dataLoaded = false; // Add this line to define the flag
  @override
  @override
  Widget build(BuildContext context) {
    // Call your function to get the list of service stations here
    getRestaurant();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant Details',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black),
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
        child: ValueListenableBuilder(
          valueListenable: RestListNotifier,
          builder:
              (BuildContext ctx, List<RestaurantModel> reslist, Widget? child) {
            return ListView.builder(
              itemCount: reslist.length,
              itemBuilder: (ctx, index) {
                final data = reslist[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      data.name2,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Phone:'),
                            Text(
                              data.phone2,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Type of Food:'),
                            Text(
                              data.type,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Place:'),
                            Text(
                              data.place,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () => _launchPhoneDialer(data.phone2),
                      child: Icon(Icons.phone, color: Colors.green),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _launchPhoneDialer(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
