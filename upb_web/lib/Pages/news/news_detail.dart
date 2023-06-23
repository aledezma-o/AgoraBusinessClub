import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

class NewsDetail extends StatelessWidget {
  final storageRef = FirebaseStorage.instance.ref();
  late String url;
  final newsData;

  NewsDetail(this.newsData);

  @override
  Widget build(BuildContext context) {
    String newsDate =
        DateFormat('yyyy-MM-dd').format(newsData["date"].toDate());
    var screenSize = MediaQuery.of(context).size;
    final newsDateWidget = Container(
      child: Text(
        newsDate,
        textAlign: TextAlign.justify,
        style: UpbTextStyle.getTextStyle('b2', ColorResourcees.p_Yellow, 'n'),
      ),
    );
    final newsTitle = Container(
        child: Text(newsData["newsTitle"],
            style:
                UpbTextStyle.getTextStyle('b1', ColorResourcees.p_Blue, 'b')));

    final newsAuthor = Container(
        child: Text(newsData["newsAuthor"],
            style:
                UpbTextStyle.getTextStyle('b2', ColorResourcees.p_Blue, 'b')));
    final newsImage = FutureBuilder(
      future: storageRef.child(newsData["newsImage"]).getDownloadURL(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Container(
                width: screenSize.width * 0.35,
                child: Image.network(
                  snapshot.data.toString(),
                  fit: BoxFit.cover,
                )),
          );
          // CustomImage( path:snapshot.data.toString(), width: screenSize.width, height: 400 );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    final newsBody = Text(
      newsData["newsDescription"],
      style: UpbTextStyle.getTextStyle('h4', Colors.black, 'b'),
      textAlign: TextAlign.justify,
    );

    return Container(
        decoration: const BoxDecoration(color: ColorResourcees.s_white),
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            newsDateWidget,
            newsTitle,
            newsAuthor,
            newsImage,
            const SizedBox(
              height: 16,
            ),
            newsBody
          ],
        ));
  }
}
