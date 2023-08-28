import 'dart:ui';

import 'package:news_app/MyTheme.dart';

class category {
  String id;
  String title;
  Color color;
  String image_path;
  
  category({required this.id,required this.title,required this.color,required this.image_path});



  static List<category> getCategories(){
    return [
      category(id: 'business', title: "Business", color: MyTheme.red_color, image_path: 'assets/images/bussines.png'),
      category(id: 'entertainment', title: "Entertainment", color: MyTheme.navy_color, image_path:'assets/images/sports.png' ),
      category(id: 'general', title: "General", color: MyTheme.pink_color, image_path: 'assets/images/environment.png'),
      category(id: 'health', title: "Health", color: MyTheme.brown_color, image_path: 'assets/images/health.png'),
      category(id: 'science', title: "Science", color: MyTheme.blue_color, image_path: 'assets/images/science.png'),
      category(id: 'sports', title: "Sports", color: MyTheme.yellow_color, image_path: 'assets/images/sports.png'),
      category(id: 'technology', title: "Technology", color: MyTheme.orange_color, image_path: 'assets/images/Politics.png')
    ];
}

}