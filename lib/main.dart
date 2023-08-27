import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';

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
      },
      debugShowCheckedModeBanner: false,

    );
  }

}