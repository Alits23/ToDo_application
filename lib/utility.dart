import 'package:note_application/task_type.dart';
import 'package:note_application/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
      image: 'images/hard_working.png',
      title: 'کار کردن',
      taskTypeEnum: TaskTypeEnum.working,
    ),
    TaskType(
      image: 'images/meditate.png',
      title: 'تمرکز',
      taskTypeEnum: TaskTypeEnum.focus,
    ),
    TaskType(
      image: 'images/social_frends.png',
      title: 'دورهمی دوستانه',
      taskTypeEnum: TaskTypeEnum.friendlyDate,
    ),
    TaskType(
      image: 'images/banking.png',
      title: 'کار اداری',
      taskTypeEnum: TaskTypeEnum.OfficeWork,
    ),
    TaskType(
      image: 'images/work_meeting.png',
      title: 'قرار کاری',
      taskTypeEnum: TaskTypeEnum.OfficeWork,
    ),
  ];
  return list;
}
