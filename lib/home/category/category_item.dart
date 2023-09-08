import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/tab_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/category.dart';

class category_item extends StatelessWidget {
  category Category;
  int index;

  category_item({required this.Category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Category.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 20),
          )),
      child: Column(
        children: [
          Image.asset(
            Category.image_path,
            height: MediaQuery.of(context).size.height*.12,
            width: MediaQuery.of(context).size.width*.27,
          ),
          Spacer(),
          Text(Category.title,style: Theme.of(context).textTheme.headline4,)
        ],
      ),
    );
  }
}
