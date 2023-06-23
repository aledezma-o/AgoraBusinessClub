import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upb_web/Components/upb_scaffold.dart';

import 'news_detail.dart';

class NewsDetailPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String newId;
  NewsDetailPage(this.newId);

  @override
  Widget build(BuildContext context) {
    return UpbScaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x3C8DBCFF), Color(0x3C8DBCFF)],
        ),
      ),
      child: FutureBuilder(
        future: _firestore.collection('news').doc(newId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data?.data();
            return FractionallySizedBox(
              widthFactor: 0.75,
              heightFactor: 0.9,
              child: NewsDetail(data),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
