import 'package:flutter/material.dart';
import 'package:taskyy/main.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskyy/models/boxes.dart';
import 'package:taskyy/models/task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double _deviceHeight, _deviceWidth;
  String? newTask;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.maybeOf(context)!.size.height;
    _deviceWidth = MediaQuery.maybeOf(context)!.size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight * 0.12,
        title: Center(
          child: Text(
            'Taskyy!',
            style: TextStyle(
              fontSize: _deviceWidth * 0.10,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: _taskView(),
      floatingActionButton: _addTask(),
    );
  }

  String _getDate() {
    DateTime date = DateTime.now();
    return DateFormat.jm().add_yMMMMd().format(date);
  }

  Widget _taskList() {
    List<Widget> tasks = <Widget>[
      ListTile(
        title: const Text("Eat banku!",
            style: TextStyle(decoration: TextDecoration.lineThrough)),
        subtitle: Text(_getDate()),
        trailing: Icon(
          Icons.check_box_outlined,
          color: customColor[800],
        ),
      )
    ];
    return ListView(
      children: tasks,
    );
  }

  Widget _addTask() {
    return FloatingActionButton(
        onPressed: _displayTaskPopup,
        tooltip: 'Add task',
        child: const Icon(Icons.add));
  }

  Widget _taskView() {
    boxTasks.put('task3',
        Task(content: "BAnku", date: DateTime.now(), isComplete: false));
    return ListView.builder(
        itemCount: boxTasks.length,
        itemBuilder: (BuildContext context, int index) {
          Task task = boxTasks.getAt(index);
          return ListTile(
            title: Text(task.content,
                style: const TextStyle(decoration: TextDecoration.lineThrough)),
            subtitle: Text("${task.date}"),
            trailing: Icon(
              Icons.check_box_outlined,
              color: customColor[800],
            ),
          );
        });
  }

  void _displayTaskPopup() {
    showDialog(
        context: context,
        builder: (BuildContext contextt) {
          return AlertDialog(
            title: const Text("Add Task"),
            content: SingleChildScrollView(
              child: TextField(
                onSubmitted: (value) {},
                onChanged: (textInput) {
                  setState(() {
                    newTask = textInput;
                  });
                },
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          );
        });
  }
}
