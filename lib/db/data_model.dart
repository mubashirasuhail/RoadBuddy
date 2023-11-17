import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String username;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String password;
  UserModel(
      {required this.name,
      required this.username,
      required this.phone,
      required this.password,
      this.id});
}

@HiveType(typeId: 2)
class ServiceModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name1;
  @HiveField(2)
  String place;
  @HiveField(3)
  String phone1;
  @HiveField(4)
  String city;
  ServiceModel(
      {required this.name1,
      required this.place,
      required this.phone1,
      required this.city,
      this.id});
}

@HiveType(typeId: 3)
class TaxiModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name2;
  @HiveField(2)
  String place1;
  @HiveField(3)
  String phone2;
  @HiveField(4)
  String city1;
  TaxiModel(
      {required this.name2,
      required this.place1,
      required this.phone2,
      required this.city1,
      this.id});
}

@HiveType(typeId: 4)
class servicetypeModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String location;
  @HiveField(2)
  String servicetype;
  @HiveField(3)
  String date;
  @HiveField(4)
  String type;
  @HiveField(5)
  String amount;
  @HiveField(6)
  String userid;
  servicetypeModel(
      {required this.location,
      required this.servicetype,
      required this.date,
      required this.type,
      required this.amount,
      required this.userid,
      this.id});
}

@HiveType(typeId: 5)
class RestaurantModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name2;
  @HiveField(2)
  String type;
  @HiveField(3)
  String phone2;
  @HiveField(4)
  String place;
  RestaurantModel(
      {required this.name2,
      required this.type,
      required this.phone2,
      required this.place,
      this.id});
}

@HiveType(typeId: 6)
class VehicleModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name2;
  @HiveField(2)
  String imagePath;
  @HiveField(3)
  String userid;
  VehicleModel(
      {required this.name2,
      required this.imagePath,
      required this.userid,
      this.id});
}

@HiveType(typeId: 7)
class InsuranceModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name2;
  @HiveField(2)
  String type;
  @HiveField(3)
  String phone2;
  @HiveField(4)
  String model;
  @HiveField(5)
  String fromdate;
  @HiveField(6)
  String todate;
  @HiveField(7)
  String userid;
  InsuranceModel(
      {required this.name2,
      required this.type,
      required this.phone2,
      required this.model,
      required this.fromdate,
      required this.todate,
      required this.userid,
      this.id});
}
