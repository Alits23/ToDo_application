import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_application/constants/colors.dart';
import 'package:note_application/task_widget.dart';

import 'task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var taskBox = Hive.box<Task>('taskBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: ListView.builder(
          itemCount: taskBox.values.length,
          itemBuilder: (context, index) {
            var task = taskBox.values.toList()[index];
            return TaskWidget(task: task);
          },
        ),
      ),
    );
  }
}
