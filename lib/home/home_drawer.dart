import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class home_drawer extends StatelessWidget {
  Function onDrawerItemClicked;
  home_drawer({required this.onDrawerItemClicked});

  static const int categoriesItem=1;
  static const int settingsItem=2;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: MyTheme.primary_color,
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * .075),
            child: Text(
              AppLocalizations.of(context)!.news_app,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 18,),
                InkWell(
                  onTap: (){
                    onDrawerItemClicked(categoriesItem);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.list),
                      SizedBox(width: 10,),
                      Text(AppLocalizations.of(context)!.categories,style: Theme.of(context).textTheme.headline2,)
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                InkWell(
                  onTap: (){
                    onDrawerItemClicked(settingsItem);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 10,),
                      Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.headline2,)
                    ],
                  ),
                ),

              ],
            ),
          )


        ],
      ),
    );
  }
}
