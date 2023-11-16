import 'package:flutter/material.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/task.dart';

class Todo extends StatefulWidget {


  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  DateTime datePicked=DateTime.now();
  String title='';
  String description='';
  var FormKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(10),
       color: Colors.white,
      child: Column(
        children: [
          Text('Add new Task',
          style: Theme.of(context).textTheme.headline2,),
          Form(
            key: FormKey,
            child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 8,),
              TextFormField(
                validator: (value) {
                  if (value==Null||value!.isEmpty){
                    return 'Please enter task title';
                  }
                  return null;
                },
                onChanged: (value) {
                  title=value;
                },
                decoration: InputDecoration(
                  hintText: 'enter your task',
                ),
              ),
              SizedBox(height: 13,),
              TextFormField(
                validator: (value) {
                  if (value == Null || value!.isEmpty) {
                    return 'Please enter task title';
                  }
                  return null;
                },
                onChanged: (value) {
                  description=value;
                },
                decoration: InputDecoration(
                  hintText: 'enter your task description',

                ),
                minLines: 4,
                maxLines: 4,
              ),
              SizedBox(height: 8,),
              Text('Select Date',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.start,),
              SizedBox(height: 5,),
              InkWell(
                onTap: () {
                   chooseDate();
                },
                child: Text('${datePicked.month}/${datePicked.day}/${datePicked.year}',
                  textAlign:TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,),
              ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed:() {
               addTask();

              }, child: Text('Add task',
              style: Theme.of(context).textTheme.subtitle2,))
            ],
          ),)
        ],
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
       setState(() {

       });
     }
  }
  void addTask(){
    if(FormKey.currentState?.validate()==true){
      Task task=Task(
        title:title,
        description:description,
        date:datePicked.microsecondsSinceEpoch
      );
      addTasktoFireStore(task).timeout(Duration(microseconds: 50),
        onTimeout: () {
          print('task added successfully');
        },
      );

    }
  }


}
