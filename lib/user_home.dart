import 'package:flutter/material.dart';
import 'package:RoadBuddy/bottom_navigation.dart';
import 'package:RoadBuddy/user_home_new.dart';
import 'package:RoadBuddy/user_restaurant.dart';
import 'package:RoadBuddy/user_servicestation.dart';
import 'package:RoadBuddy/user_taxi.dart';

class Homescreen1 extends StatefulWidget {
  final String userId;
  final String name;
  static ValueNotifier<int> selectedIndexNotifiier = ValueNotifier(0);

  Homescreen1({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  State<Homescreen1> createState() => _Homescreen1State();
}

class _Homescreen1State extends State<Homescreen1> {
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Homescreennew(userId: widget.userId, name: widget.name),
      servicestation2(),
      TaxiUser(),
      restaurantUser(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Homescreen1.selectedIndexNotifiier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
    );
  }
}
