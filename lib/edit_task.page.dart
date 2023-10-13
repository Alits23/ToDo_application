import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/constants/colors.dart';
import 'package:note_application/task.dart';
import 'package:note_application/task_type.dart';
import 'package:note_application/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

class EditTaskpage extends StatefulWidget {
  EditTaskpage({super.key, required this.task});
  Task task;
  @override
  State<EditTaskpage> createState() => _EditTaskpageState();
}

class _EditTaskpageState extends State<EditTaskpage> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  TextEditingController? controllerTaskTitle;
  TextEditingController? controllerTaskSubTitle;
  final taskBox = Hive.box<Task>('taskBox');
  DateTime? _time;
  int _selectedTypeTaskItem = 0;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    controllerTaskTitle = TextEditingController(text: widget.task.title);
    controllerTaskSubTitle = TextEditingController(text: widget.task.subTitle);

    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });

    var index = getTaskTypeList().indexWhere(
      (element) {
        return element.image == widget.task.taskType.image;
      },
    );
    _selectedTypeTaskItem = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
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
                  height: 25,
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
                        labelText: 'توضیحات تسک',
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
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onPositivePressed: (context, time) {
                    _time = time;
                  },
                  onNegativePressed: (context) {},
                ),
                Container(
                  height: 190,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    scrollDirection: Axis.horizontal,
                    itemCount: getTaskTypeList().length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedTypeTaskItem = index;
                          });
                        },
                        child: TaskTypeItemList(
                          taskType: getTaskTypeList()[index],
                          index: index,
                          selectedTypeTaskItem: _selectedTypeTaskItem,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 48),
                    backgroundColor: color1,
                  ),
                  onPressed: () {
                    String TaskTitle = controllerTaskTitle!.text;
                    String TaskSubTitle = controllerTaskSubTitle!.text;
                    editTask(TaskTitle, TaskSubTitle);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ویرایش  تسک',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  editTask(String TaskTitle, String TaskSubTitle) {
    widget.task.title = TaskTitle;
    widget.task.subTitle = TaskSubTitle;
    widget.task.time = _time!;
    widget.task.taskType = getTaskTypeList()[_selectedTypeTaskItem];
    widget.task.save();
  }
}

class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList({
    super.key,
    required this.taskType,
    required this.index,
    required this.selectedTypeTaskItem,
  });
  TaskType taskType;
  int index;
  int selectedTypeTaskItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: (selectedTypeTaskItem == index) ? 3 : 2,
          color: (selectedTypeTaskItem == index) ? color1 : color3,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      margin: EdgeInsets.all(8),
      width: 140,
      child: Column(
        children: [
          Image.asset(taskType.image),
          Text(taskType.title),
        ],
      ),
    );
  }
}
