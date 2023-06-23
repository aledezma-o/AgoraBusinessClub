import 'package:flutter/material.dart';

import 'news_card.dart';

class NewsList extends StatelessWidget {
  final List<dynamic> jsonObjects;

  NewsList(this.jsonObjects);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.75,
        height: size.height * 0.85,
        child: Center(
          child: ListView.builder(
            itemCount: jsonObjects.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsCard(jsonObjects[index].id, jsonObjects[index].data(),
                  index.isOdd);
            },
          ),
        ),
      ),
    );
  }
}
