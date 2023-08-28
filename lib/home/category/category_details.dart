import 'package:flutter/material.dart';
import 'package:news_app/ApiManager.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/home/tab_container.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/models/category.dart';

class category_details extends StatelessWidget {
  category Category;
  category_details({required this.Category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(Category?.id??''),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: MyTheme.primary_color,));
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){}, child: Text("Try again"))
              ],
            );
          }
          if(snapshot.data?.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data?.message??''),
                ElevatedButton(onPressed: (){}, child: Text("Try again"))
              ],
            );
          }
          var sourcesList=snapshot.data?.sources??[];
          return tab_container(sourcesList: sourcesList);
        },
    );
  }
}
