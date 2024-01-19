import 'package:flutter/material.dart';
import 'package:hivesample/addpage.dart';
import 'package:hivesample/function/db_function.dart';
import 'package:hivesample/model/data_model.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    getAllData();
    return Scaffold(
      body: ValueListenableBuilder<List<DataModel>>(
        valueListenable: dataNotifier,
        builder: (context, datas, child) {
          return ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, index) {
              DataModel data = datas[index];
              return ListTile(
                title: Text(data.name),
                subtitle: Text('${data.age}'),
                trailing: GestureDetector(
                  onTap: () {
                    deleteData(index);
                  },
                  child: Icon(Icons.delete)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListAdding()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
