import 'package:flutter/material.dart';

class LanguageSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('English',style:Theme.of(context).textTheme.subtitle1,),
          SizedBox(height: 20,),
          Text('Arabic',style:Theme.of(context).textTheme.subtitle1,)
        ],
      ),
    );
  }
}
