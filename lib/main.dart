import 'package:appdemo/Model/items.dart';
import 'package:flutter/material.dart';
import 'package:appdemo/widget/cardboywidget.dart';
import 'package:appdemo/widget/modelButton.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Dataitems> items = [];

  void handleAddTask(String name) {
    final item = Dataitems(id: DateTime.now().toString(), name: name);
    
    // print(item);
    setState(() {
      items.add(item);
    });
  }
  void handleDeleteTask(String id){
    setState(() {
      items.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Center(child: Text('ToDoList', style: TextStyle(fontSize: 30))),
          backgroundColor: Color.fromARGB(255, 245, 154, 184),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: items
                  .map((items) => cardbody(
                        items: items,deleteTask: handleDeleteTask,
                      ))
                  .toList(),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Color.fromARGB(255, 245, 154, 184),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext content) {
                  return modelButton(addTask: handleAddTask);
                });
          },
          child: Icon(
            Icons.add,
            size: 40,
          ),
          backgroundColor: Color.fromARGB(255, 245, 154, 184),
        ));
  }
}
