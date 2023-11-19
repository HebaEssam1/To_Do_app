import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/MyThemeData.dart';
import 'package:to_do_app/editTask.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/list_provider/list_provider.dart';
import 'package:to_do_app/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TaskItem extends StatelessWidget {
   Task task;
   TaskItem({required this.task});
  @override
  Widget build(BuildContext context) {
    var listprovider=Provider.of<listProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(editTask.routeName,arguments: task);
      },
      child: Container(
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
              color: Theme.of(context).primaryColor,
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
                  decoration:BoxDecoration(
                      color:task.isDone==false? MyThemeData.primaryLightColor:
                  MyThemeData.greenColor,
                  borderRadius: BorderRadius.circular(50))
                ),
                Column(
                  children: [
                    Text(task.title,style: task.isDone==false?Theme.of(context).textTheme.headline5:
                      Theme.of(context).textTheme.headline6,),
                    Text(task.description, style: task.isDone==false?Theme.of(context).textTheme.headline5:
              Theme.of(context).textTheme.headline6,),
                  ],
                ),
                task.isDone==false?
                InkWell(
                  onTap: () {
                    TaskDone(task);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyThemeData.primaryLightColor,
                    ),
                    child: Icon(Icons.check,
                    color: MyThemeData.whiteColor,size:30),
                  ),
                ):
                    Text('Done!',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: MyThemeData.greenColor,
                    ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
