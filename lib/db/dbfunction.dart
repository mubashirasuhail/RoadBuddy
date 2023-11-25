import 'package:RoadBuddy/insurance.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:RoadBuddy/db/data_model.dart';

ValueNotifier<List<UserModel>> UserListNotifier = ValueNotifier([]);
int _nextUserId = 1; // Initialize a variable to track the next user ID

Future<void> addUser(UserModel value) async {
  final usrdb = await Hive.openBox<UserModel>('user_db');
  value.id = _nextUserId; // Set the ID for the user
  final _id = await usrdb.add(value);
  if (_id != null) {
    _nextUserId++; // Increment the next user ID
    UserListNotifier.value.add(value);
    UserListNotifier.notifyListeners();
  }
}

Future<void> getAllusers() async {
  final usrdb = await Hive.openBox<UserModel>('user_db');
  UserListNotifier.value.clear();
  UserListNotifier.value.addAll(usrdb.values);
  UserListNotifier.notifyListeners();
}

/*Future<void>getAllusers()async{
  final usrdb=await Hive.openBox<UserModel>('user_db');
  usrdb.values;
  UserListNotifier.value.addAll(usrdb.values);
}*/
ValueNotifier<List<ServiceModel>> ServiceListNotifier = ValueNotifier([]);
Future<void> addServicestation(ServiceModel value) async {
  final srvcdb = await Hive.openBox<ServiceModel>('servicestation_db');

  final _id = await srvcdb.add(value);
  value.id = _id;
  ServiceListNotifier.value.add(value);
  ServiceListNotifier.notifyListeners();
}

Future<void> getAllservice() async {
  final srvcdb = await Hive.openBox<ServiceModel>('servicestation_db');
  ServiceListNotifier.value.clear();
  ServiceListNotifier.value.addAll(srvcdb.values);
  ServiceListNotifier.notifyListeners();
}

Future<void> deleteService(int id) async {
  final srvcdb = await Hive.openBox<ServiceModel>('servicestation_db');
  await srvcdb.delete(id);
  getAllservice();
}

Future<void> updateService(String newName, String newPlace, String newPhone,
    String newCity, int id) async {
  final serviceBox = await Hive.openBox<ServiceModel>('servicestation_db');

  final service = serviceBox.get(id);

  if (service != null) {
    service.name1 = newName;
    service.place = newPlace;
    service.phone1 = newPhone;
    service.city = newCity;

    await serviceBox.put(id, service);
  }

  await serviceBox.close();
  getAllservice();
}

ValueNotifier<List<TaxiModel>> TaxiListNotifier = ValueNotifier([]);
Future<void> addTaxi(TaxiModel value) async {
  final txidb = await Hive.openBox<TaxiModel>('Taxi_db');

  final _id1 = await txidb.add(value);
  value.id = _id1;
  TaxiListNotifier.value.add(value);
  TaxiListNotifier.notifyListeners();
}

Future<void> getTaxi() async {
  final txidb = await Hive.openBox<TaxiModel>('Taxi_db');
  TaxiListNotifier.value.clear();
  TaxiListNotifier.value.addAll(txidb.values);
  TaxiListNotifier.notifyListeners();
}

Future<void> deleteTaxi(int id) async {
  final txidb = await Hive.openBox<TaxiModel>('Taxi_db');
  await txidb.delete(id);
  getTaxi();
}

Future<void> updateTaxi(String newName, String newPlace, String newPhone,
    String newCity, int id) async {
  final taxiBox = await Hive.openBox<TaxiModel>('Taxi_db');

  final taxi = taxiBox.get(id);

  if (taxi != null) {
    taxi.name2 = newName;
    taxi.place1 = newPlace;
    taxi.phone2 = newPhone;
    taxi.city1 = newCity;

    await taxiBox.put(id, taxi);
  }

  await taxiBox.close();
  getTaxi();
}

ValueNotifier<List<servicetypeModel>> Servicetypelistnotifier =
    ValueNotifier([]);
Future<void> addservicetype(servicetypeModel value) async {
  final srvctypedb = await Hive.openBox<servicetypeModel>('Servicetype_db');

  final _id1 = await srvctypedb.add(value);
  value.id = _id1;
  Servicetypelistnotifier.value.add(value);
  Servicetypelistnotifier.notifyListeners();
}

Future<void> getservicetype() async {
  final srvctypedb = await Hive.openBox<servicetypeModel>('Servicetype_db');
  Servicetypelistnotifier.value.clear();
  Servicetypelistnotifier.value.addAll(srvctypedb.values);
  Servicetypelistnotifier.notifyListeners();
}

Future<void> updateservicetype(String newType, int id) async {
  final srvctypeBox = await Hive.openBox<servicetypeModel>('Servicetype_db');

  final srvctype = srvctypeBox.get(id);

  if (srvctype != null) {
    srvctype.type = newType;

    await srvctypeBox.put(id, srvctype);
  }

  await srvctypeBox.close();
  getservicetype();
}

ValueNotifier<List<RestaurantModel>> RestListNotifier = ValueNotifier([]);
Future<void> addRestaurant(RestaurantModel value) async {
  final resdb = await Hive.openBox<RestaurantModel>('Res_db');

  final _id1 = await resdb.add(value);
  value.id = _id1;
  RestListNotifier.value.add(value);
  RestListNotifier.notifyListeners();
}

Future<void> getRestaurant() async {
  final resdb = await Hive.openBox<RestaurantModel>('Res_db');
  RestListNotifier.value.clear();
  RestListNotifier.value.addAll(resdb.values);
  RestListNotifier.notifyListeners();
}

Future<void> deleteRestaurant(int id) async {
  final resdb = await Hive.openBox<RestaurantModel>('Res_db');
  await resdb.delete(id);
  getRestaurant();
}

Future<void> updateRestaurant(String newName, String newPlace, String newPhone,
    String newCity, int id) async {
  final resBox = await Hive.openBox<RestaurantModel>('Res_db');

  final res = resBox.get(id);

  if (res != null) {
    res.name2 = newName;
    res.type = newPlace;
    res.phone2 = newPhone;
    res.place = newCity;

    await resBox.put(id, res);
  }

  await resBox.close();
  getRestaurant();
}

ValueNotifier<List<VehicleModel>> Vehiclelistnotifier = ValueNotifier([]);
Future<void> addvehicledetails(VehicleModel value) async {
  final vhcldb = await Hive.openBox<VehicleModel>('Vehicle_db');

  final _id1 = await vhcldb.add(value);
  value.id = _id1;
  Vehiclelistnotifier.value.add(value);
  Vehiclelistnotifier.notifyListeners();
}

Future<void> getvehicle() async {
  final vhcldb = await Hive.openBox<VehicleModel>('Vehicle_db');
  Vehiclelistnotifier.value.clear();
  Vehiclelistnotifier.value.addAll(vhcldb.values);
  Vehiclelistnotifier.notifyListeners();
}

ValueNotifier<List<InsuranceModel>> Insurancelistnotifier = ValueNotifier([]);
Future<void> addinsurance(InsuranceModel value) async {
  final insrncdb = await Hive.openBox<InsuranceModel>('Insurance_db');

  final _id1 = await insrncdb.add(value);
  value.id = _id1;
  Insurancelistnotifier.value.add(value);
  Insurancelistnotifier.notifyListeners();
}

Future<void> getInsurance() async {
  final insrncdb = await Hive.openBox<InsuranceModel>('Insurance_db');
  Insurancelistnotifier.value.clear();
  Insurancelistnotifier.value.addAll(insrncdb.values);
  Insurancelistnotifier.notifyListeners();
}
