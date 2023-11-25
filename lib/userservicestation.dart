import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';

class servicestation2 extends StatelessWidget {
  const servicestation2({super.key});

  // bool _dataLoaded = false; // Add this line to define the flag
  @override
  /*void initState() {
    super.initState();
    if (!_dataLoaded) {
      getAllservice();
      _dataLoaded = true;
    }
  }*/
  @override
  Widget build(BuildContext context) {
    // Call your function to get the list of service stations here
    getAllservice();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Service Stations',
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
        child: ValueListenableBuilder(
          valueListenable: ServiceListNotifier,
          builder:
              (BuildContext ctx, List<ServiceModel> srvicelist, Widget? child) {
            return ListView.builder(
              itemCount: srvicelist.length,
              itemBuilder: (ctx, index) {
                final data = srvicelist[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      data.name1,
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
                              data.phone1,
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
                        Row(
                          children: [
                            Text('City:'),
                            Text(
                              data.city,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () => _launchPhoneDialer(data.phone1),
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
