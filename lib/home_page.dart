import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/car.dart';
import 'package:note_application/student.dart';
import 'package:note_application/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = TextEditingController();
  var box = Hive.box('names');
  var carBox = Hive.box<Car>('carBox');
  var studentBox = Hive.box<Student>('student');
  var user = Hive.box<User>('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      value = value!;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
