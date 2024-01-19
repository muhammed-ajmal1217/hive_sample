import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivesample/model/data_model.dart';

ValueNotifier<List<DataModel>> dataNotifier = ValueNotifier([]);
addData(DataModel data) async {
  final dataDb = await Hive.openBox<DataModel>('databox');
  dataDb.add(data);
  List<DataModel> datas = dataDb.values.toList();
  dataNotifier.value = datas;
  dataNotifier.notifyListeners();
}
getAllData() async {
  final dataDb = await Hive.openBox<DataModel>('databox');
  List<DataModel> datas = dataDb.values.toList();
  dataNotifier.value = datas;
  dataNotifier.notifyListeners();
}
deleteData(int index)async{
  final dataDb = await Hive.openBox<DataModel>('databox');
  dataDb.deleteAt(index);
  dataNotifier.notifyListeners();
  getAllData();
}

