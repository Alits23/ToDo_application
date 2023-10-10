import 'package:flutter/material.dart';
import 'package:note_application/edit_task.page.dart';
import 'package:note_application/task.dart';

import 'constants/colors.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  var isBoxChecked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.task.isDone = isBoxChecked;
          widget.task.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: getMainContent(),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: isBoxChecked,
                    onChanged: (value) {
                      setState(
                        () {
                          isBoxChecked = !isBoxChecked;
                          widget.task.isDone = isBoxChecked;
                          widget.task.save();
                        },
                      );
                    },
                  ),
                  Text(
                    widget.task.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              Text(
                widget.task.subTitle.toString(),
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
              ),
              Spacer(),
              getTimeAndEdit(),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Image.asset('images/workout.png'),
      ],
    );
  }

  Row getTimeAndEdit() {
    return Row(
      children: [
        Container(
          width: 93,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: color1,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.task.time.hour}:${widget.task.time.minute}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditTaskpage(task: widget.task),
            ));
          },
          child: Container(
            width: 93,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: color2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ویرایش'),
                SizedBox(
                  width: 10,
                ),
                Image.asset('images/icon_edit.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
