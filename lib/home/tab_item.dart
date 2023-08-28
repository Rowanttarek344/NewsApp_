import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';

import '../models/SourcesResponse.dart';

class tab_item extends StatelessWidget {
  Source source;
  bool isSelected;
  tab_item({required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected==true?MyTheme.primary_color:Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: MyTheme.primary_color,
          width: 3
        ),

      ),
      child: Text(source.name??"",
        style: isSelected==true?
        Theme.of(context).textTheme.headline5:
        Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
