import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivesample/home.dart';
import 'package:hivesample/model/data_model.dart';

void main ()async{
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  if(!Hive.isAdapterRegistered(DataModelAdapter().typeId)){
    Hive.registerAdapter(DataModelAdapter());
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}