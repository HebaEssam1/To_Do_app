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
      padding: EdgeInsets.all(5),
       color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Text('Add new Task',
          style: Theme.of(context).textTheme.subtitle1,),
          Form(
            key: FormKey,
            child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 5,),
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
                  hintStyle: Theme.of(context).textTheme.subtitle1,

                ),
              ),
              SizedBox(height: 10,),
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
                  hintStyle: Theme.of(context).textTheme.subtitle1,
                ),
                minLines: 4,
                maxLines: 4,
              ),
              SizedBox(height: 5,),
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
              SizedBox(height: 10,),
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
          Navigator.pop(context);
        },
      );

    }
  }


}
