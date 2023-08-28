import 'package:flutter/material.dart';
import 'package:news_app/ApiManager.dart';
import 'package:news_app/home/news_item.dart';

import '../MyTheme.dart';

class news_details extends StatelessWidget {
  String source;
  news_details({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNews(source),
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
          var newsList=snapshot.data?.articles??[];
          return Expanded(
            child: ListView.builder(
              itemCount:newsList.length ,
                itemBuilder: (context, index) {
                  return news_item(article: newsList[index]);
                },
            ),
          );

        },
    );
  }
}
