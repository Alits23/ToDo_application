import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/constants/colors.dart';
import 'package:note_application/task.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubTitle = TextEditingController();

  final taskBox = Hive.box<Task>('taskBox');
  DateTime? _time;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: controllerTaskTitle,
                      focusNode: negahban1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        labelText: 'موضوع تسک',
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: negahban1.hasFocus ? color1 : color3,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: color3,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: color1,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: controllerTaskSubTitle,
                      maxLines: 2,
                      focusNode: negahban2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        labelText: 'درباره تسک',
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: negahban2.hasFocus ? color1 : color3,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: color3,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: color1,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                CustomHourPicker(
                  elevation: 2,
                  title: 'انتخاب کردن زمان',
                  titleStyle: TextStyle(
                    color: color1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  positiveButtonText: 'انتخاب زمان',
                  positiveButtonStyle: TextStyle(
                    color: color1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  negativeButtonText: 'لغو',
                  negativeButtonStyle: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onPositivePressed: (context, time) {
                    _time = time;
                  },
                  onNegativePressed: (context) {},
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 48),
                    backgroundColor: color1,
                  ),
                  onPressed: () {
                    String TaskTitle = controllerTaskTitle.text;
                    String TaskSubTitle = controllerTaskSubTitle.text;
                    addTask(TaskTitle, TaskSubTitle);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'اضافه کردن تسک',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addTask(String TaskTitle, String TaskSubTitle) {
    taskBox.add(
      Task(title: TaskTitle, subTitle: TaskSubTitle, time: _time!),
    );
  }
}
