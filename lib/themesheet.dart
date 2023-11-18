import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/MyThemeData.dart';
import 'package:to_do_app/list_provider/list_provider.dart';

class ThemeSheet extends StatelessWidget {

  String selected='light';
  @override
  Widget build(BuildContext context) {
    var listprovider=Provider.of<listProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                listprovider.changeTheme(ThemeMode.light);
              },

              child:listprovider.theme==ThemeMode.light?
                      Selected(text: 'Light'):
                      Unselected(text: 'light')),

          SizedBox(height: 20,),
          InkWell(
            onTap: () {
              listprovider.changeTheme(ThemeMode.dark);
            },
            child: listprovider.theme==ThemeMode.dark?
            Selected(text: 'Dark'):
            Unselected(text: 'Dark')
          )


        ],
      ),
    );
  }
}
class Selected extends StatelessWidget {
  String text;
  Selected({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(text,style: Theme.of(context).textTheme.headline3,),
          SizedBox(width: 5,),
          Icon(Icons.check,color: MyThemeData.primaryLightColor,)
        ],
      ),
    );
  }
}
class Unselected extends StatelessWidget {
  
  String text;
  Unselected({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.headline2,);
  }
}


