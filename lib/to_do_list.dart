import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/MyThemeData.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/task.dart';
import 'package:to_do_app/task_item.dart';

import 'list_provider/list_provider.dart';
class ToDoList extends StatefulWidget {
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    var listprovider= Provider.of<listProvider>(context);
    listprovider.getAllTaskFromFireStore();
    return Container(
      color: listprovider.theme==ThemeMode.light ?MyThemeData.backgroundLightColor: MyThemeData.backgroundDarkColor,
      //margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: listprovider.selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              listprovider.changeDate(date);
            },

            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor:listprovider.theme==ThemeMode.light ? MyThemeData.blackColor: MyThemeData.whiteColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MyThemeData.primaryLightColor,
            dotsColor: MyThemeData.whiteColor,
            selectableDayPredicate: (date) =>true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder (
              itemBuilder: (context, index) {
                return TaskItem(task:listprovider.taskList[index]);
              },
              itemCount: listprovider.taskList.length,
            ),
          )
        ],
      ),
    );
  }


}
