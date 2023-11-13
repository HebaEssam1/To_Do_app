import 'package:flutter/material.dart';

class Todo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
       color: Colors.white,
      child: Column(
        children: [
          Text('Add new Task',
          style: Theme.of(context).textTheme.headline2,),
          Form(child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'enter your task',

                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'enter your task description',

                ),
                minLines: 4,
                maxLines: 4,
              ),
              SizedBox(height: 15,),
              Text('Select Date',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.start,),
              SizedBox(height: 5,),
              InkWell(
                onTap: () {

                },
                child: Text('4/12/2023',textAlign:TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,),
              ),
              SizedBox(height: 25,),
              ElevatedButton(onPressed:() {

              }, child: Text('Add task',
              style: Theme.of(context).textTheme.subtitle2,))
            ],
          ),)
        ],
      ),
    );
  }
}
