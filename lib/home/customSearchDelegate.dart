import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';

import '../ApiManager.dart';
import '../MyTheme.dart';
import 'news_item.dart';

class customSearchDelegate extends SearchDelegate<Articles>{
  @override
  List<Widget>? buildActions(BuildContext context) { //like actions after search query
    return [
      IconButton(onPressed: (){
        showResults(context);
      }, icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) { //icon before search query
    return IconButton(onPressed: (){
      Navigator.of(context).pop();

    }, icon: Icon(Icons.close));

  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.queryArticle(query),
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
        return ListView.builder(
          itemCount:newsList.length ,
          itemBuilder: (context, index) {
            return news_item(article: newsList[index]);
          },
        );

      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('');

  }

}