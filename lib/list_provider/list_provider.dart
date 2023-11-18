import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../firebase_utils.dart';
import '../task.dart';

class listProvider extends ChangeNotifier {
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();
  String language='English';
  ThemeMode theme=ThemeMode.light;
  void changeTheme (ThemeMode newtheme){
    if(theme==newtheme){
      return;
    }
    theme=newtheme;
    notifyListeners();
  }
 Future<void> getAllTaskFromFireStore() async {
    QuerySnapshot<Task> querysnapshot = await getTaskCollection().get();
    taskList = querysnapshot.docs.map((e) {
      return e.data();
    }).toList();
    taskList = taskList.where((task) {
      DateTime date = DateTime.fromMicrosecondsSinceEpoch(task.date);
      if (selectedDate.day == date.day &&
          selectedDate.month == date.month &&
          selectedDate.year == date.year) {
        return true;
      }
      return false;
    }).toList();
    notifyListeners();
  }
  void changeDate(DateTime newDate){
   selectedDate=newDate;
   notifyListeners();
  }
}
