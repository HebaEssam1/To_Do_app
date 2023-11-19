import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/MyThemeData.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/list_provider/list_provider.dart';
import 'package:to_do_app/task.dart';

class editTask extends StatefulWidget {

  static const  String routeName='edit task';

  @override
  State<editTask> createState() => _editTaskState();
}

class _editTaskState extends State<editTask> {
  DateTime datePicked=DateTime.now();
  String newtitle='';
  String newdescription='';
  @override
  Widget build(BuildContext context)  {
    var listprovider=Provider.of<listProvider>(context);
    var args=ModalRoute.of(context)?.settings.arguments as Task;
    DateTime date=DateTime.fromMicrosecondsSinceEpoch(args.date);
    if(datePicked==DateTime.now()){
      datePicked=date;
    }
    if(newtitle==''&& newdescription==''){
      newtitle=args.title;
      newdescription=args.description;
    }

    return Scaffold(
      backgroundColor:listprovider.theme==ThemeMode.light ? MyThemeData.backgroundLightColor: MyThemeData.backgroundDarkColor ,
      appBar: AppBar(
        title: Text('To Do List', style: Theme.of(context).textTheme.headline1,),
      ),
      body:Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyThemeData.whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(height: 15,),
            Text('Edit Task', style: Theme.of(context).textTheme.subtitle2,textAlign: TextAlign.center,),
            SizedBox(height: 30,),
            TextField(
              onChanged: (value) {
                newtitle=value;
              },
              decoration: InputDecoration(
            hintText: args.title,
          hintStyle: Theme.of(context).textTheme.subtitle1
        )
              ),
            SizedBox(height: 20,),

            TextField(
              onChanged: (value) {
                newdescription=value;
              },
              minLines: 4,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: args.description,
                    hintStyle: Theme.of(context).textTheme.subtitle1
                )
            ),
            SizedBox(height: 5,),
            Text('Select Date',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.start,),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                chooseDate();
                print(datePicked);
              },
              child: Text('${datePicked.month}/${datePicked.day}/${datePicked.year}',
                textAlign:TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed:() {
              changeTask(args, newtitle, newdescription, datePicked).timeout(Duration(seconds: 3),onTimeout: () {
                Navigator.pop(context);
              },);

            }, child: Text('Edit Task',
                style: Theme.of(context).textTheme.headline1))
          ],
        ),
      ),
      );

  }

  void chooseDate() async{
    DateTime? chosenDate= await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(chosenDate!=null){
      datePicked=chosenDate;
      print(datePicked);
      setState(() {

      });
    }

  }
}
