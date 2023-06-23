import 'package:flutter/material.dart';

import 'about_us_company_card.dart';

class AboutUsCompanyList extends StatelessWidget {
  final List<dynamic> jsonObjects;

  AboutUsCompanyList(this.jsonObjects);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.55,
      height: size.height * 0.75,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: jsonObjects.length,
        itemBuilder: (BuildContext context, int index) {
          return AboutUsCompanyCard(
              jsonObjects[index].id, jsonObjects[index].data());
        },
      ),
    );
  }
}
