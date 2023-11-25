import 'package:flutter/material.dart';

import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';

class myRequest extends StatelessWidget {
  final String userId;
  final String name;
  const myRequest({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Call your function to get the list of service stations here
    getservicetype();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Request List',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: Servicetypelistnotifier,
          builder: (BuildContext ctx, List<servicetypeModel> srvicelist,
              Widget? child) {
            // Filter the list based on userId
            final filteredList =
                srvicelist.where((data) => data.userid == userId).toList();

            return ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (ctx, index) {
                final data = filteredList[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      data.servicetype,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Date and Time:'),
                            Text(
                              data.date,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Status:'),
                            Text(
                              data.type,
                              style: TextStyle(
                                fontSize: 14,
                                color: data.type == "Rejected"
                                    ? Colors.red
                                    : (data.type == "Request" ||
                                            data.type == "Accepted")
                                        ? Colors.green
                                        : Colors.black,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text('Amount:'),
                            Text(
                              data.amount,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
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
}
