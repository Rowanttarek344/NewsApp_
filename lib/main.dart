import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/home/tab_container.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: home_screen.routeName,
     routes: {
        home_screen.routeName :(context)=> home_screen(),
       //category_details.routeName:(context) => category_details()
      },
      theme: MyTheme.light_theme,
      debugShowCheckedModeBanner: false,

    );
  }

}