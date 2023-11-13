import 'package:flutter/material.dart';
import 'package:to_do_app/MyThemeData.dart';
import 'package:to_do_app/settings.dart';
import 'package:to_do_app/to_do_list.dart';
import 'package:to_do_app/todo.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String route_name='Home Page';

int selectedindex=0;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('To Do List', style: Theme.of(context).textTheme.headline1,),
      ),
     body: Tabs[selectedindex],
     floatingActionButton: FloatingActionButton(
       onPressed: () {
         showtodosheet();
       },
       child: Icon(Icons.add),
       shape: RoundedRectangleBorder(
         borderRadius:BorderRadius.circular(50),
         side:BorderSide(
           color: MyThemeData.whiteColor,
           width: 2
         )
       ),
     ),
     floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
     bottomNavigationBar: BottomAppBar(
       shape: CircularNotchedRectangle(),
       notchMargin: 8,
       child: BottomNavigationBar(
         currentIndex: selectedindex,
         onTap: (index) {
           selectedindex=index;
           setState(() {

           });
         },
         items: [
           BottomNavigationBarItem(icon:
              ImageIcon(AssetImage('assets/images/icon_list.png')),
           label: 'to do list'),
           BottomNavigationBarItem(icon:
           ImageIcon(AssetImage('assets/images/icon_settings.png')),
               label: 'Settings'),


         ],
       ),
     ),
   );
  }
  List<Widget> Tabs=[ToDoList(),Settings()];

  void showtodosheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Todo(),);
  }
}
