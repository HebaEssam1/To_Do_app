import 'package:flutter/material.dart';
import 'package:to_do_app/MyThemeData.dart';

class TaskItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(''),
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
    );
  }
}
