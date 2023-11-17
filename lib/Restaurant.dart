import 'package:flutter/material.dart';
import 'package:RoadBuddy/Taxiupdate.dart';
import 'package:RoadBuddy/createtaxi.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';
import 'package:RoadBuddy/restaurantupdate.dart';
import 'package:RoadBuddy/restcreate.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _restaurantState();
}

class _restaurantState extends State<Restaurant> {
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
    getRestaurant();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant List',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx1) => const restaurantCreate()),
              );
            },
            child: const Text('+ Create'),
          )
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
        child: ValueListenableBuilder(
          valueListenable: RestListNotifier,
          builder: (BuildContext ctx, List<RestaurantModel> restaurantlist,
              Widget? child) {
            return ListView.builder(
              itemCount: restaurantlist.length,
              itemBuilder: (ctx, index) {
                final data = restaurantlist[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(data.name2,
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => restaurantUpdate(
                                      name1: data.name2,
                                      place: data.type,
                                      id: data.id,
                                      phone1: data.phone2,
                                      city: data.place,
                                    )));
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            //
                            showDialog(
                                context: context,
                                builder: (ctx1) {
                                  return AlertDialog(
                                    title: const Text('Delete'),
                                    content: const Text(
                                        'Do you want delete this item'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx1).pop();
                                        },
                                        child: const Text('close'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          if (data.id != null) {
                                            deleteRestaurant(data.id!);
                                          }
                                          Navigator.of(ctx1).pop();
                                        },
                                        child: const Text('yes'),
                                      ),
                                    ],
                                  );
                                });

                            //}
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Handle item tap
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Serviceupdate(name: data.name1,place: data.place,id: data.id,phone: data.phone1,city: data.city,)));
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
