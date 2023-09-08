import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/home/news_details_page.dart';
import 'package:news_app/models/NewsResponse.dart';

class news_item extends StatelessWidget {
  Articles article;
  news_item({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(news_details_page.routeName,
            arguments:news_details_args(article: article)
        );
      },
      child: Container(
        margin: EdgeInsets.all( 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: MyTheme.primary_color,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              article.title ?? '',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8,),

            Text(
              article.description ?? '',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(height: 8,),

            Text(
              article.publishedAt ?? '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: MyTheme.gray_color
              ),
              textAlign:TextAlign.end,
            )
          ],
        ),
      ),
    );
  }
}
