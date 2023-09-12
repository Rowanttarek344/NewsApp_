import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLang='en';
  void changeLang(String newLang){
    if(appLang==newLang){
      return;
    }
    appLang=newLang;
    notifyListeners();
  }
}