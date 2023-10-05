import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/student.dart';

import 'car.dart';
import 'home_page.dart';
import 'user.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('names');
  Hive.registerAdapter(CarAdapter());
  await Hive.openBox<Car>('carBox');
  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox<Student>('student');

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('user');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
