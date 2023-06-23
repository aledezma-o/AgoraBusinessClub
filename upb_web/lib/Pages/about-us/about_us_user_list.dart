import 'package:flutter/material.dart';

import 'about_us_user_card.dart';

class AboutUsUserList extends StatelessWidget {
  final List<dynamic> jsonObjects;

  AboutUsUserList(this.jsonObjects);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.35,
      height: size.height * 0.75,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: jsonObjects.length,
        itemBuilder: (BuildContext context, int index) {
          return AboutUsCard(jsonObjects[index].id, jsonObjects[index].data());
        },
      ),
    );
  }
}
