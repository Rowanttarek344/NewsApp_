import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_item.dart';

import '../../models/category.dart';

class categories_screen extends StatelessWidget {
  Function onCategoryClicked;
  categories_screen({required this.onCategoryClicked});

  List<category> categories = category.getCategories();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Pick your category \n of interest',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) => InkWell(
                  onTap:(){
                    onCategoryClicked(categories[index]);
                  },

                    child: category_item(
                        Category: categories[index], index: index)),
                itemCount: categories.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
