// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      name: fields[1] as String,
      username: fields[2] as String,
      phone: fields[3] as String,
      password: fields[4] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ServiceModelAdapter extends TypeAdapter<ServiceModel> {
  @override
  final int typeId = 2;

  @override
  ServiceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceModel(
      name1: fields[1] as String,
      place: fields[2] as String,
      phone1: fields[3] as String,
      city: fields[4] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name1)
      ..writeByte(2)
      ..write(obj.place)
      ..writeByte(3)
      ..write(obj.phone1)
      ..writeByte(4)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaxiModelAdapter extends TypeAdapter<TaxiModel> {
  @override
  final int typeId = 3;

  @override
  TaxiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaxiModel(
      name2: fields[1] as String,
      place1: fields[2] as String,
      phone2: fields[3] as String,
      city1: fields[4] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TaxiModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name2)
      ..writeByte(2)
      ..write(obj.place1)
      ..writeByte(3)
      ..write(obj.phone2)
      ..writeByte(4)
      ..write(obj.city1);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaxiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class servicetypeModelAdapter extends TypeAdapter<servicetypeModel> {
  @override
  final int typeId = 4;

  @override
  servicetypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return servicetypeModel(
      location: fields[1] as String,
      servicetype: fields[2] as String,
      date: fields[3] as String,
      type: fields[4] as String,
      amount: fields[5] as String,
      userid: fields[6] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, servicetypeModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.servicetype)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.amount)
      ..writeByte(6)
      ..write(obj.userid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is servicetypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RestaurantModelAdapter extends TypeAdapter<RestaurantModel> {
  @override
  final int typeId = 5;

  @override
  RestaurantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestaurantModel(
      name2: fields[1] as String,
      type: fields[2] as String,
      phone2: fields[3] as String,
      place: fields[4] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, RestaurantModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name2)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.phone2)
      ..writeByte(4)
      ..write(obj.place);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehicleModelAdapter extends TypeAdapter<VehicleModel> {
  @override
  final int typeId = 6;

  @override
  VehicleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleModel(
      name2: fields[1] as String,
      imagePath: fields[2] as String,
      userid: fields[3] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, VehicleModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name2)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.userid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InsuranceModelAdapter extends TypeAdapter<InsuranceModel> {
  @override
  final int typeId = 7;

  @override
  InsuranceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InsuranceModel(
      name2: fields[1] as String,
      type: fields[2] as String,
      phone2: fields[3] as String,
      model: fields[4] as String,
      fromdate: fields[5] as String,
      todate: fields[6] as String,
      userid: fields[7] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, InsuranceModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name2)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.phone2)
      ..writeByte(4)
      ..write(obj.model)
      ..writeByte(5)
      ..write(obj.fromdate)
      ..writeByte(6)
      ..write(obj.todate)
      ..writeByte(7)
      ..write(obj.userid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InsuranceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
