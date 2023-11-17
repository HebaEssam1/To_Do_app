import 'package:flutter/material.dart';
import 'package:to_do_app/MyThemeData.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TaskItem extends StatelessWidget {
   Task task;
   TaskItem({required this.task});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                topLeft: Radius.circular(50)
              ),
              onPressed: (context) {
                  DeleteTaskFromFirestore(task);
              },
              backgroundColor: MyThemeData.redColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: MyThemeData.whiteColor,
            borderRadius: BorderRadius.circular(20)
          ),

          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 5,
                height: 70,
                decoration:BoxDecoration(color: MyThemeData.primaryLightColor,
                borderRadius: BorderRadius.circular(50))
              ),
              Column(
                children: [
                  Text(task.title,style: Theme.of(context).textTheme.subtitle1,),
                  Text(task.description,style: Theme.of(context).textTheme.subtitle1,),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyThemeData.primaryLightColor,
                ),

                child: Icon(Icons.check,
                color: MyThemeData.whiteColor,size:30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
