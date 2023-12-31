import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/screens/add_task_page.dart';
import 'package:note_application/constants/colors.dart';
import 'package:note_application/widget/task_widget.dart';

import '../data/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var taskBox = Hive.box<Task>('taskBox');
  bool isFabVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                setState(() {
                  if (notification.direction == ScrollDirection.forward) {
                    isFabVisible = true;
                  }
                  if (notification.direction == ScrollDirection.reverse) {
                    isFabVisible = false;
                  }
                  if (notification.direction == ScrollDirection.idle) {
                    isFabVisible = true;
                  }
                });
                //not a matter return if is false or true
                return true;
              },
              child: ListView.builder(
                itemCount: taskBox.values.length,
                itemBuilder: (context, index) {
                  var task = taskBox.values.toList()[index];
                  return getTaskWidget(task);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddTaskPage(),
                ),
              );
            },
            backgroundColor: color1,
            child: Image.asset('images/icon_add.png')),
      ),
    );
  }

  Widget getTaskWidget(Task task) {
    return Dismissible(
        key: UniqueKey(),
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'حذف',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'حذف',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        onDismissed: (direction) {
          task.delete();
        },
        child: TaskWidget(task: task));
  }
}
