import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:to_do_app/MyThemeData.dart';
import 'package:to_do_app/task_item.dart';
class ToDoList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyThemeData.backgroundLightColor,
      //margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: MyThemeData.blackColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Theme.of(context).primaryColor,
            dotsColor: MyThemeData.whiteColor,
            selectableDayPredicate: (date) =>true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder (
              itemBuilder: (context, index) {
                return TaskItem();
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
