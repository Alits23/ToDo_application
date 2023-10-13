import 'package:flutter/material.dart';
import 'package:note_application/task_type.dart';

import 'constants/colors.dart';

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
        color: (selectedTypeTaskItem == index) ? color1 : color3,
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
          Text(
            taskType.title,
            style: TextStyle(
              fontSize: (selectedTypeTaskItem == index) ? 18 : 16,
              color:
                  (selectedTypeTaskItem == index) ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
