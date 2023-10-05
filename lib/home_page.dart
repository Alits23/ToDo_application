import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_application/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: getTaskItem(),
      ),
    );
  }

  Container getTaskItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      height: 132,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: getMainContent(),
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
                  MSHCheckbox(
                    size: 32,
                    value: isChecked,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: color1,
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) {
                      setState(
                        () {
                          isChecked = selected;
                        },
                      );
                    },
                  ),
                  Text('ورزش'),
                ],
              ),
              Text('با داداشم برم ورزش'),
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
                Text('10:10'),
                SizedBox(
                  width: 10,
                ),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
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
      ],
    );
  }
}
