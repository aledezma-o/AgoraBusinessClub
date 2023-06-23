import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Components/iconPanel/titlePage.dart';
import '../../Components/iconPanel/upb_footer.dart';
import '../../Components/upb_scaffold.dart';
import 'package:upb_web/static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

import 'package:upb_web/Components/image_cover.dart';
import 'package:upb_web/Components/cards/card_member_about-us.dart';
import 'package:upb_web/Components/cards/card_title_text.dart';

import 'about_us_user_list.dart';
import 'about_us_company_list.dart';
import 'package:upb_web/Pages/news/news_list.dart';

class AboutUsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<dynamic> userObjects = [];
  List<dynamic> companyObjects = [];
  List<dynamic> newsObjects = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final cover = CoverImage(
      height: size.height * 0.5,
      width: size.width * 0.85,
      path: "../assets/img/AboutUs.png",
    );


    final imageUrls = [
      //"assets/img/equipo/1.png",
      "assets/img/equipo/6.png",
      "assets/img/equipo/2.png",
      "assets/img/equipo/4.png",
      "assets/img/equipo/7.png",
      "assets/img/equipo/5.png",
      "assets/img/equipo/3.png",
    ];

    final members = Wrap(
      alignment: WrapAlignment.center,
      spacing: 16.0,
      runSpacing: 16.0,
      children: imageUrls.map((imageUrl) => Container(
        width: size.width*0.25,
        height: size.width*0.25,
        child: Image.network(imageUrl),
      )).toList(),
    );
    final vision = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TitleTextCard(
            title: "Donde Vamos",
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean arcu augue, sagittis eu fermentum at, scelerisque at metus. Duis nec nunc suscipit, pretium nunc at, ullamcorper felis. Nam sed urna rhoncus, semper ex a, gravida nunc. Aliquam suscipit mauris non mi egestas cursus. Etiam sagittis lorem at maximus mollis. Nulla in pharetra enim. Integer nec imperdiet augue. Donec ex massa, pulvinar at auctor ac, rutrum quis sapien. Curabitur vel leo enim.\nPhasellus convallis id neque quis ultricies. Donec sed arcu condimentum lacus dapibus efficitur nec nec ipsum. Sed id malesuada neque, at laoreet arcu. Aenean id vestibulum lorem. Nulla mattis arcu sed mauris mattis, id congue felis condimentum. Ut molestie, purus pharetra blandit dictum, eros elit dignissim arcu, nec malesuada ex magna eu nisi. Quisque eget tempus mi, nec vehicula eros. Fusce egestas facilisis felis, eu eleifend eros rhoncus nec. Ut eu lorem non augue tincidunt tincidunt et maximus ante. Morbi vehicula elementum tortor ac semper.",
            width: size.width * 0.4),
        TitleTextCard(
            title: "Donde Vamos.",
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean arcu augue, sagittis eu fermentum at, scelerisque at metus. Duis nec nunc suscipit, pretium nunc at, ullamcorper felis. Nam sed urna rhoncus, semper ex a, gravida nunc. Aliquam suscipit mauris non mi egestas cursus. Etiam sagittis lorem at maximus mollis. Nulla in pharetra enim. Integer nec imperdiet augue. Donec ex massa, pulvinar at auctor ac, rutrum quis sapien. Curabitur vel leo enim.\nPhasellus convallis id neque quis ultricies. Donec sed arcu condimentum lacus dapibus efficitur nec nec ipsum. Sed id malesuada neque, at laoreet arcu. Aenean id vestibulum lorem. Nulla mattis arcu sed mauris mattis, id congue felis condimentum. Ut molestie, purus pharetra blandit dictum, eros elit dignissim arcu, nec malesuada ex magna eu nisi. Quisque eget tempus mi, nec vehicula eros. Fusce egestas facilisis felis, eu eleifend eros rhoncus nec. Ut eu lorem non augue tincidunt tincidunt et maximus ante. Morbi vehicula elementum tortor ac semper.",
            width: size.width * 0.4),
      ],
    );
    final noticias = StreamBuilder(
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
    );
    return UpbScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity, 
                color: ColorResourcees.grey_UPB.withOpacity(0.85),
                child: Text(
                  "Nosotros",
                  style: UpbTextStyle.getTextStyle("mh3", ColorResourcees.p_Yellow, "b"),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 32,),
              //cover,
              members,
              //vision,
              noticias,
              UpbFooter()
            ],
          ),
        ),
      ),
    );
  }
}
