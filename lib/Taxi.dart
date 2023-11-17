import 'package:flutter/material.dart';
import 'package:RoadBuddy/Taxiupdate.dart';
import 'package:RoadBuddy/createtaxi.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';

class Taxi extends StatefulWidget {
  const Taxi({super.key});

  @override
  State<Taxi> createState() => _taxiState();
}

class _taxiState extends State<Taxi> {
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
    getTaxi();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Taxi List',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx1) => const taxiCreate()),
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
          valueListenable: TaxiListNotifier,
          builder: (BuildContext ctx, List<TaxiModel> taxilist, Widget? child) {
            return ListView.builder(
              itemCount: taxilist.length,
              itemBuilder: (ctx, index) {
                final data = taxilist[index];
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
                                builder: (ctx) => Taxiupdate(
                                      name1: data.name2,
                                      place: data.place1,
                                      id: data.id,
                                      phone1: data.phone2,
                                      city: data.city1,
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
                                            deleteTaxi(data.id!);
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
