import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';

class TaxiUser extends StatefulWidget {
  const TaxiUser({Key? key}) : super(key: key);

  @override
  _TaxiUserState createState() => _TaxiUserState();
}

class _TaxiUserState extends State<TaxiUser> {
  late List<TaxiModel> taxiList;
  String sortingField = 'charge'; // Default sorting by "charge"
  String filteringOption = 'All'; // Default filter option

  @override
  void initState() {
    super.initState();
    getTaxi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Taxi Details',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              DropdownButton<String>(
                value: sortingField,
                items: <String>['charge', 'type'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    sortingField = newValue ?? '';
                    filterData();
                  });
                },
              ),
              sortingField == 'charge'
                  ? DropdownButton<String>(
                      value: filteringOption,
                      items: <String>[
                        'All',
                        'Below 100',
                        '100-500',
                        'Above 500'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          filteringOption = newValue ?? 'All';
                          filterData();
                        });
                      },
                    )
                  : DropdownButton<String>(
                      value: filteringOption,
                      items: <String>['All', '5seater', '7seater', 'Others']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          filteringOption = newValue ?? 'All';
                          filterData();
                        });
                      },
                    ),
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
        child: ValueListenableBuilder(
          valueListenable: TaxiListNotifier,
          builder: (BuildContext ctx, List<TaxiModel> txilist, Widget? child) {
            taxiList = txilist;
            filterData(); // Apply filtering and sorting based on selected options

            return ListView.builder(
              itemCount: taxiList.length,
              itemBuilder: (ctx, index) {
                final data = taxiList[index];
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
                            Text('Vehicle Type:'),
                            Text(
                              data.place1,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Charge per km:'),
                            Text(
                              data.city1,
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

  int customSortType(String a, String b) {
    if ((a == '5seater' || a == '7seater') &&
        (b != '5seater' && b != '7seater')) {
      return -1;
    } else if ((a != '5seater' && a != '7seater') &&
        (b == '5seater' || b == '7seater')) {
      return 1;
    } else {
      return 0;
    }
  }

  void filterData() {
    if (sortingField == 'charge') {
      taxiList.sort((a, b) => customSortCharge(a.city1, b.city1));
    } else if (sortingField == 'type') {
      taxiList.sort((a, b) => customSortType(a.place1, b.place1));
    }

    if (filteringOption != 'All') {
      taxiList = taxiList.where((item) {
        if (sortingField == 'charge') {
          return filterByCharge(item.city1, filteringOption);
        } else if (sortingField == 'type') {
          return filterByType(item.place1, filteringOption);
        }
        return true;
      }).toList();
    }
  }

  bool filterByCharge(String charge, String filterOption) {
    final int chargeValue = int.tryParse(charge) ?? 0;
    if (filterOption == 'Below 100' && chargeValue < 100) {
      return true;
    } else if (filterOption == '100-500' &&
        chargeValue >= 100 &&
        chargeValue <= 500) {
      return true;
    } else if (filterOption == 'Above 500' && chargeValue > 500) {
      return true;
    }
    return false;
  }

  bool filterByType(String vehicleType, String filterOption) {
    if (filterOption == 'All') {
      return true;
    } else {
      return vehicleType == filterOption;
    }
  }

  void _launchPhoneDialer(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int customSortCharge(String a, String b) {
    final int chargeA = int.tryParse(a) ?? 0;
    final int chargeB = int.tryParse(b) ?? 0;

    if (chargeA < 100 && chargeB < 100) {
      return chargeA - chargeB;
    } else if ((chargeA >= 100 && chargeA <= 500) &&
        (chargeB >= 100 && chargeB <= 500)) {
      return chargeA - chargeB;
    } else if (chargeA > 500 && chargeB > 500) {
      return chargeA - chargeB;
    } else {
      if (chargeA < 100) return -1;
      if (chargeB < 100) return 1;
      if ((chargeA >= 100 && chargeA <= 500) && (chargeB > 500)) return -1;
      if ((chargeB >= 100 && chargeB <= 500) && (chargeA > 500)) return 1;
      if ((chargeA >= 100 && chargeA <= 500) && (chargeB < 100)) return 1;
      if ((chargeB >= 100 && chargeB <= 500) && (chargeA < 100)) return -1;
      return 0;
    }
  }
}
