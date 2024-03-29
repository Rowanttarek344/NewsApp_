import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/home/category/categories_screen.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/customSearchDelegate.dart';
import 'package:news_app/home/settings/settings_screen.dart';
import 'package:news_app/models/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_drawer.dart';

class home_screen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/pattern.png",
              ),
              fit: BoxFit.fill),
          color: Colors.white),
      child: Scaffold(
        appBar: selectedDrawerItem == 1 && selectedCategory == null
            ? AppBar(
                title: Text(
                  AppLocalizations.of(context)!.news_app,
                  style: Theme.of(context).textTheme.headline1,
                ),
                centerTitle: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35),
                        bottomLeft: Radius.circular(35))),
              )
            : selectedDrawerItem == 1 && selectedCategory != null
                ? AppBar(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate: customSearchDelegate());
                          },
                          icon: Icon(
                            Icons.search,
                            color: MyTheme.white_color,
                          ),
                        ),
                      )
                    ],
                    title: Text(
                      AppLocalizations.of(context)!.news_app,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    centerTitle: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(35),
                            bottomLeft: Radius.circular(35))),
                  )
                : AppBar(
                    title: Text(
                      AppLocalizations.of(context)!.news_app,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    centerTitle: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(35),
                            bottomLeft: Radius.circular(35))),
                  ),
        drawer: Drawer(
          child: home_drawer(onDrawerItemClicked: onDrawerItemClicked),
        ),
        body: selectedDrawerItem == 2
            ? settings_screen()
            : selectedCategory == null
                ? categories_screen(onCategoryClicked: onCategoryClicked)
                : category_details(Category: selectedCategory!),
      ),
    );
  }

  category? selectedCategory = null;
  void onCategoryClicked(category Category) {
    selectedCategory = Category;
    setState(() {});
  }

  int selectedDrawerItem = home_drawer.categoriesItem;
  void onDrawerItemClicked(int index) {
    selectedDrawerItem = index;
    selectedCategory = null;
    Navigator.of(context).pop();
    setState(() {});
  }
}
