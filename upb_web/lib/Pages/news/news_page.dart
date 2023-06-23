import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:upb_web/static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';
import '../../Components/iconPanel/titlePage.dart';
import '../../Components/upb_scaffold.dart';
import '../../Components/iconPanel/upb_footer.dart';
import 'news_list.dart';

class NewsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<dynamic> newsObjects = [];

  @override
  Widget build(BuildContext context) {
    return UpbScaffold(
        body: Container(
      child: Center(
        child: ListView(
          children: [
          Container(
              width: double.infinity, 
              color: ColorResourcees.grey_UPB.withOpacity(0.85),
              child: Text(
                "Noticias",
                style: UpbTextStyle.getTextStyle("mh3", ColorResourcees.p_Yellow, "b"),
                textAlign: TextAlign.center,
              ),
            ),
          StreamBuilder(
          stream: _firestore.collection('news').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data?.docs;
              newsObjects.clear();
              data?.forEach((element) {
                newsObjects.add(element);
              });
              return NewsList(newsObjects);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        UpbFooter()
      ])
      ),
    ));
  }
}
