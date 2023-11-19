import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/MyThemeData.dart';
import 'package:to_do_app/editTask.dart';
import 'package:to_do_app/list_provider/list_provider.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
    create: (context) => listProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var listprovider=Provider.of<listProvider>(context);
    return MaterialApp(
      routes: {
        HomePage.routeName : (context) => HomePage(),
        editTask.routeName : (context) => editTask()
      },
      initialRoute: HomePage.routeName,
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      themeMode:listprovider.theme ,
    );
  }
}

