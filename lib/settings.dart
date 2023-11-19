import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/MyThemeData.dart';
import 'package:to_do_app/languagesheet.dart';
import 'package:to_do_app/list_provider/list_provider.dart';
import 'package:to_do_app/themesheet.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String language='English';

  String theme='light';

  @override
  Widget build(BuildContext context) {
    var listprovider =Provider.of<listProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      color: listprovider.theme==ThemeMode.light ?MyThemeData.backgroundLightColor: MyThemeData.backgroundDarkColor,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children:[
            Text('language',style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.start,),
           InkWell(
             onTap: () {
               openlanguagebottomsheet();
             },
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 color: Theme.of(context).primaryColor
               ),
               margin: EdgeInsets.all(10),
               padding: EdgeInsets.all(10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(listprovider.language,style: Theme.of(context).textTheme.headline3,),
                   Icon(Icons.arrow_drop_down_sharp,color: MyThemeData.primaryLightColor,)
                 ],
               ),
             ),
           ),
           SizedBox(height: 15,),
           Text('theme',style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.start,),
           InkWell(
             onTap: () {
               openthemebottomsheet();
             },
             child: Container(
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Theme.of(context).primaryColor
               ),
               margin: EdgeInsets.all(10),
               padding: EdgeInsets.all(10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(listprovider.theme==ThemeMode.light ?'light':'dark',style: Theme.of(context).textTheme.headline3,),
                   Icon(Icons.arrow_drop_down_sharp,color: MyThemeData.primaryLightColor,)
                 ],
               ),
             ),
           )
         ]

       ),

    );
  }

  void openlanguagebottomsheet() {
    showModalBottomSheet(context: context,
        builder:(context) => LanguageSheet(),);
  }

  void openthemebottomsheet() {
    showModalBottomSheet(context: context,
      builder:(context) => ThemeSheet(),);
  }
}
