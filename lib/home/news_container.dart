import 'package:flutter/material.dart';
import 'package:news_app/ApiManager.dart';
import 'package:news_app/home/news_item.dart';

import '../MyTheme.dart';
import '../models/NewsResponse.dart';

class news_details extends StatefulWidget {
  String source;
  news_details({required this.source});

  @override
  State<news_details> createState() => _news_detailsState();
}

class _news_detailsState extends State<news_details> {
  final scrollcontroller=ScrollController();
  bool shouldLoadNextPage=false;
  int pageNumber=1;
  List<Articles> newsList=[];


  @override
  void initState() {
    super.initState();

    // Setup the listener.
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.atEdge) { //taht f akher el list
        bool isTop = scrollcontroller.position.pixels == 0;
        if (!isTop) {
          shouldLoadNextPage=true;
          setState(() {

          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(shouldLoadNextPage){
      ApiManager.getNews(widget.source,++pageNumber)
          .then((newsResponse){
         newsList.addAll(newsResponse.articles??[]);
         shouldLoadNextPage=false;
         setState(() {

         });
      });
    }
    return FutureBuilder(
      future: ApiManager.getNews(widget.source,null),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){}, child: Text("Try again"))
              ],
            );
          }
          else if(snapshot.data?.status=='error'){
            return Column(
              children: [
                Text(snapshot.data?.message??''),
                ElevatedButton(onPressed: (){}, child: Text("Try again"))
              ],
            );
          }
         else if(snapshot.hasData){
            if(newsList.isEmpty){
              newsList=snapshot.data?.articles??[];
            }
            else if(snapshot.data?.articles?[0].title != newsList[0].title){
              scrollcontroller.jumpTo(0);
              newsList=snapshot.data?.articles??[];
            }
            return Expanded(
              child: ListView.builder(
                controller: scrollcontroller,
                itemCount:newsList.length ,
                itemBuilder: (context, index) {
                  return news_item(article: newsList[index]);
                },
              ),
            );
          }
         else{
            return Center(child: CircularProgressIndicator(color: MyTheme.primary_color,));
          }

        },
    );
  }
}
