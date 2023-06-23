import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

class NewsCard extends StatelessWidget {
  final newsId;
  final newsData;
  final position;
  late String urlImage;

  NewsCard(this.newsId, this.newsData, this.position) {}

  @override
  Widget build(BuildContext context) {
    String newsDate =
        DateFormat('yyyy-MM-dd').format(newsData["date"].toDate());
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/news/$newsId");
          },
          child: Container(
              padding: const EdgeInsets.all(8),
              width: constraints.maxWidth * 0.5,
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.1,
                    height: size.height * 0.2,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: StreamBuilder(
                      stream: FirebaseStorage.instance
                          .ref()
                          .child(newsData["newsImage"])
                          .getDownloadURL()
                          .asStream(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: snapshot.data,
                            width: size.width * 0.2,
                            height: size.height * 0.2,
                            fit: BoxFit.cover,
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                  Container(
                    width: size.width * 0.6,
                    height: 156,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          newsDate,
                          textAlign: TextAlign.justify,
                          style: UpbTextStyle.getTextStyle("b3", ColorResourcees.p_Yellow, "l")
                        ),
                        SizedBox(height: 8),
                        Text(
                          newsData["newsTitle"],
                          textAlign: TextAlign.justify,
                          style: UpbTextStyle.getTextStyle("b1", ColorResourcees.p_Blue, "b")
                        ),
                        SizedBox(height: 8),
                        Text(
                          newsData["newsDescription"],
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: UpbTextStyle.getTextStyle("b3", ColorResourcees.s_grey, "b")
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
