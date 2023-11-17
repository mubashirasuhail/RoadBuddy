import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/splash.dart';
//onst SAVE_KEY_NAME='UserLoggedIn';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  if (!Hive.isAdapterRegistered(ServiceModelAdapter().typeId)) {
    Hive.registerAdapter(ServiceModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TaxiModelAdapter().typeId)) {
    Hive.registerAdapter(TaxiModelAdapter());
  }
  if (!Hive.isAdapterRegistered(servicetypeModelAdapter().typeId)) {
    Hive.registerAdapter(servicetypeModelAdapter());
  }
  if (!Hive.isAdapterRegistered(RestaurantModelAdapter().typeId)) {
    Hive.registerAdapter(RestaurantModelAdapter());
  }
  if (!Hive.isAdapterRegistered(VehicleModelAdapter().typeId)) {
    Hive.registerAdapter(VehicleModelAdapter());
  }
  if (!Hive.isAdapterRegistered(VehicleModelAdapter().typeId)) {
    Hive.registerAdapter(VehicleModelAdapter());
  }
  if (!Hive.isAdapterRegistered(InsuranceModelAdapter().typeId)) {
    Hive.registerAdapter(InsuranceModelAdapter());
  }

  runApp( Myappl());
}

class Myappl extends StatelessWidget {
   Myappl({super.key});
  final Future<FirebaseApp>_initialization=Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login project',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder:(context,snapshot){
          if(snapshot.hasError){
            print('Error');
          }
          if(snapshot.connectionState==ConnectionState.done){
            return Splashscreen();
          }
          return CircularProgressIndicator();
        } )
    );
  }
}
