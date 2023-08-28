import 'package:flutter/material.dart';
import 'package:news_app/home/news_container.dart';
import 'package:news_app/home/tab_item.dart';

import '../models/SourcesResponse.dart';

class tab_container extends StatefulWidget {
  List<Source> sourcesList;
  tab_container({required this.sourcesList});

  @override
  State<tab_container> createState() => _tab_containerState();
}

class _tab_containerState extends State<tab_container> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: DefaultTabController(

          length: widget.sourcesList.length,
          child: Column(
            children: [
              TabBar(
                onTap: (index) {
                  selectedIndex=index;
                  setState(() {

                  });

                },
                isScrollable: true,
                  indicatorColor:Colors.transparent ,
                  tabs: widget.sourcesList.map((source) => tab_item(source: source,
                      isSelected:selectedIndex==widget.sourcesList.indexOf(source)
                  )).toList()
              ),
              news_details(source:widget.sourcesList[selectedIndex].id??'')
            ],
          )
      ),
    );
  }
}
