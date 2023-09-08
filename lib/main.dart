import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/Providers/AppConfigProvider.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/home/news_container.dart';
import 'package:news_app/home/news_details_page.dart';
import 'package:news_app/home/tab_container.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main(){
  runApp(ChangeNotifierProvider(create: (BuildContext context) { return AppConfigProvider(); },
  child: MyApp()));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      initialRoute: home_screen.routeName,
     routes: {
        home_screen.routeName :(context)=> home_screen(),
       news_details_page.routeName:(context) => news_details_page()
      },
      theme: MyTheme.light_theme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale:Locale( provider.appLang),


    );
  }

}