import 'package:flutter/material.dart';
import 'package:taskyy/main.dart';
import 'package:intl/intl.dart';
import 'package:taskyy/models/boxes.dart';
import 'package:taskyy/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    return ListView.builder(
        itemCount: boxTasks.length,
        itemBuilder: (BuildContext context, int index) {
          Task task = boxTasks.getAt(index);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
            child: Card(
              child: ListTile(
                title: Text("${task.content}",
                    style: TextStyle(
                        decoration: task.isComplete
                            ? TextDecoration.lineThrough
                            : null)),
                subtitle: Text(task.date),
                trailing: Icon(
                  task.isComplete
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined,
                  color: customColor[800],
                ),
                onTap: () {
                  task.isComplete = !task.isComplete;
                  boxTasks.putAt(index, task);
                  setState(() {});
                },
                onLongPress: () {
                  boxTasks.deleteAt(index);
                  setState(() {});
                },
              ),
            ),
          );
        });
  }

  Widget _addTask() {
    return FloatingActionButton(
        onPressed: _displayTaskPopup,
        tooltip: 'Add task',
        child: const Icon(Icons.add));
  }

  Widget _taskView() {
    return FutureBuilder(
        future: Hive.openBox('tasks'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            boxTasks = snapshot.data;
            return _taskList();
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const CircularProgressIndicator();
          }
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
                onSubmitted: (value) {
                  if (newTask != null) {
                    var task = Task(
                        content: newTask, date: _getDate(), isComplete: false);
                    boxTasks.add(task);
                    setState(() {
                      newTask = null;
                      Navigator.pop(context);
                    });
                  }
                },
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
