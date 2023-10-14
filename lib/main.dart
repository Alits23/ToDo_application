import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/task.dart';
import 'data/task_type.dart';
import 'data/type_enum.dart';
import 'screens/home_page.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());
  await Hive.openBox<Task>('taskBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SM',
        textTheme: TextTheme(
          headline4: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
