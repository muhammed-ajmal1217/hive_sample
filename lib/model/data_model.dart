import 'package:hive/hive.dart';
part 'data_model.g.dart';
@HiveType(typeId: 1)
class DataModel{
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  DataModel({
    required this.name,
    required this.age,
  });
}