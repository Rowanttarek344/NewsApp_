import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../MyTheme.dart';

class news_details_page extends StatefulWidget {
  static const String routeName = 'news-details-page';

  @override
  State<news_details_page> createState() => _news_details_pageState();
}

class _news_details_pageState extends State<news_details_page> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as news_details_args;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/pattern.png",
              ),
              fit: BoxFit.fill),
          color: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.article.title!,
            style: Theme
                .of(context)
                .textTheme
                .headline1,
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35))),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: CachedNetworkImage(
                    imageUrl: args.article.urlToImage ?? '',
                    placeholder: (context, url) =>
                        Center(
                            child: CircularProgressIndicator(
                              color: MyTheme.primary_color,
                            )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  args.article.title ?? '',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  args.article.description ?? '',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle2,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  args.article.publishedAt ?? '',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: MyTheme.gray_color),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  args.article.content ?? '',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1,
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: ()=>_launchURL(args.article.url!),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'view full article',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: MyTheme.gray_color),
                        textAlign: TextAlign.end,
                      ),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String link) async {
    var url=Uri.parse(link);
    try {
      await launchUrl(url);
    } catch (e) {
      print('Error launching URL: $e');
    }

  }
}

class news_details_args {
  Articles article;
  news_details_args({required this.article});
}
