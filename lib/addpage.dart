import 'package:flutter/material.dart';
import 'package:hivesample/function/db_function.dart';
import 'package:hivesample/model/data_model.dart';

class ListAdding extends StatelessWidget {
   ListAdding({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200,),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
               borderSide: BorderSide.none,
              ),
              hintText: 'Name',
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
               borderSide: BorderSide.none,
              ),
              hintText: 'Age',
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            addDatas(context);
          }, child: Text('Add'))
        ],
      ),
    );
  }
  
  void addDatas(BuildContext context) {
    if(nameController.text.isNotEmpty||ageController.text.isNotEmpty){
     final data=DataModel(name: nameController.text.trim(), age: int.parse(ageController.text));
     addData(data);
     nameController.clear();
     ageController.clear();
     Navigator.pop(context);
    }
  }
}