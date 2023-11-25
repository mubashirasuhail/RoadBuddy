import 'package:flutter/material.dart';
import 'package:RoadBuddy/userhome.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Homescreen1.selectedIndexNotifiier,
      builder: (BuildContext ctx, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
          currentIndex: updatedIndex,
          onTap: (newIndex) {
            Homescreen1.selectedIndexNotifiier.value = newIndex;
          },
          selectedItemColor: Colors.deepPurple, // Color for the selected item
          unselectedItemColor: Colors.grey, // Color for unselected items
          type: BottomNavigationBarType
              .fixed, // Fix the layout to show all labels
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home', // Label for the Home item
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_repair),
              label: 'Service', // Label for the Service item
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_taxi),
              label: 'Taxi', // Label for the Taxi item
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Restaurant', // Label for the Restaurant item
            ),
          ],
        );
      },
    );
  }
}
