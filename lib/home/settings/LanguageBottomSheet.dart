import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Providers/AppConfigProvider.dart';

class LanguageBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

    return Container(
      color: MyTheme.white_color,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: (){
                provider.changeLang('en');
              },
              child: provider.appLang=='en'?
              getSelectedItemWidget(AppLocalizations.of(context)!.english,context):
              getUnselectedItemWidget(AppLocalizations.of(context)!.english,context)
          ),
          SizedBox(height: 12,),
          InkWell(
              onTap: (){
                provider.changeLang('ar');
              },
              child: provider.appLang=='ar'?
              getSelectedItemWidget(AppLocalizations.of(context)!.arabic,context):
              getUnselectedItemWidget(AppLocalizations.of(context)!.arabic,context)
          )

        ],
      ),
    );

  }

  getSelectedItemWidget(String language, BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,style: Theme.of(context).textTheme.headline6),
        Icon(Icons.check,
            color: MyTheme.primary_color,
        )
      ],
    );

  }

  getUnselectedItemWidget(String language, BuildContext context) {
    return Text(language,style: Theme.of(context).textTheme.subtitle2,);

  }

}
