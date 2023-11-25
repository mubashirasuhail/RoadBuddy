import 'package:flutter/material.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';

class acceptRequset extends StatefulWidget {
  const acceptRequset({super.key});

  @override
  State<acceptRequset> createState() => _acceptRequsetState();
}

class _acceptRequsetState extends State<acceptRequset> {
  @override
  Widget build(BuildContext context) {
    getservicetype();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accept/Reject',
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
          valueListenable: Servicetypelistnotifier,
          builder: (BuildContext ctx, List<servicetypeModel> srvicelist,
              Widget? child) {
            return ListView.builder(
              itemCount: srvicelist.length,
              itemBuilder: (ctx, index) {
                final data = srvicelist[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(data.servicetype,
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(data.location),
                        Text(
                          data.type,
                          style: TextStyle(
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx1) {
                                return AlertDialog(
                                  title: const Text('Accept Message'),
                                  content: const Text('Accept this order'),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        await updateservicetype(
                                            'Accepted', data.id!);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx1).pop();
                                      },
                                      child: const Text('close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          child: const Text('Accept'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx1) {
                                return AlertDialog(
                                  title: const Text('Reject Message'),
                                  content: const Text('Reject this order'),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        await updateservicetype(
                                            'Rejected', data.id!);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx1).pop();
                                      },
                                      child: const Text('close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          child: const Text('Reject'),
                        ),
                      ],
                    ),
                    onTap: () {
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
