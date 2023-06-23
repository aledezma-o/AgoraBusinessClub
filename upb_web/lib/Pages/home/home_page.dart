import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upb_web/static_resources/color_resources.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Components/customPainter/title_backgroud.dart';
import '../../Components/iconPanel/upb_footer.dart';
import '../../Components/upb_scaffold.dart';
import '../../Components/cards/user_card_info.dart';
import '../news/news_list.dart';
import 'package:upb_web/Components/iconPanel/logos_model.dart';
import '../../Components/iconPanel/icon_view.dart';
import 'dart:convert';
import '../../Components/image_cover.dart';
import '../../Static_resources/theme_data.dart';


class MyHomePage extends StatelessWidget {
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<dynamic> newsObjects = [];
  late Future<String> future;
  String listPaths = "assets/routes/route_logos_list.json";
  late  Map<String, List<String>> routList ;

  Future<String> readJsonFile(String listPaths) async {
      return await rootBundle.loadString(listPaths);
    }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final accreditationsView2 = Column(
      children: [
        InkWell(
          onTap: (){
            launch("https://www.upb.edu/es/contenido/centro-de-desarrollo-de-negocios");
          },
          child: Tooltip(
            message: "Centro de Desarrollo de Negocios",
            child: Image.asset("img/Convenciones_Logos/CDN/cdn.jpg"),
          ),
        ),
        InkWell(
          onTap: () {
            launch("https://www.jcicochabamba.org/");
          },
          child: Tooltip(
            message: "JCI CBBA",
            child: Image.asset(
              "img/Convenciones_Logos/JCI/cbba.jpg",
              // Add any additional properties you need for the image
            ),
          ),
        ),
        InkWell(
          onTap: (){
            launch("https://www.instagram.com/seupb.2023/");
          },
          child: Tooltip(
            message: "SEUPB CBBA",
            child: Image.asset("img/Convenciones_Logos/UPB/seupb2023.jpg"),
          ),
        ),
      ],
    );
    final accreditationsView = FutureBuilder(
        future: readJsonFile(listPaths),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done)
          {
            Map<String, dynamic> routeLists = jsonDecode(snapshot.data!);
            List<dynamic> titleAgreements = routeLists['JCI-individual'] as List<dynamic>;
            List<LogoModel> agreementsList = titleAgreements.map((agreement) => LogoModel(
              title: agreement['title'] as String,
              logo: agreement['logo'] as String,
              link: agreement['link'] as String,
            )).toList();
            // Map<String, dynamic> routeLists = jsonDecode(snapshot.data!);
            // List<dynamic> titleAgreements = routeLists['JCI'] as List<dynamic>;
            // List<LogoModel> agreementsList = titleAgreements.map((agreement) => LogoModel(
            //   title: agreement['title'] as String,
            //   logo: agreement['logo'] as String,
            //   link: agreement['link'] as String,
            // )).toList();
            List<dynamic> exchangeAgreements = routeLists['UPB'] as List<dynamic>;
            List<LogoModel> exchangeList = exchangeAgreements.map((agreement) => LogoModel(
              title: agreement['title'] as String,
              logo: agreement['logo'] as String,
              link: agreement['link'] as String,
            )).toList();
            List<dynamic> memberships = routeLists['memberships'] as List<dynamic>;
            List<LogoModel> membershipsList = memberships.map((agreement) => LogoModel(
              title: agreement['title'] as String,
              logo: agreement['logo'] as String,
              link: agreement['link'] as String,
            )).toList();
            List<dynamic> cdn = routeLists['CDN'] as List<dynamic>;
            List<LogoModel> cdnList= cdn.map((agreement) => LogoModel(
              title: agreement['title'] as String,
              logo: agreement['logo'] as String,
              link: agreement['link'] as String,
            )).toList();
            return Column(
              children: [
                IconView(
                  titleView: "CDN - UPB",
                  routList: cdnList,
                ),
                IconView(
                  titleView: "JCI",
                  routList: agreementsList,
                ),
                IconView(
                  titleView: "UPB",
                  routList: exchangeList,
                ),
                
              ],
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
       }});

    final cover = CoverImage(
      height: size.height * 0.5,
      width: size.width * 0.85,
      path: "assets/img/header_images/header_membresias.jpeg",
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

    return UpbScaffold(
      body: Container(
        //height: size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    CoverImage(path: "../../assets/img/upb-logo.png", width: size.width * 0.1, height: MediaQuery.of(context).size.width * 0.1),
                    const SizedBox(width: 16,),
                    Text(
                       "Agora Business Club",
                       style: UpbTextStyle.getTextStyle("mh2", ColorResourcees.p_Blue, "b"),
                       textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    right: -200,
                    child: Container(
                      height: 330.0,
                      width: 430.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(300.0),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TitleBackgroud(title: 'Bienvenidos al Agora', assetName: 'assets/formas/title_home_bk.svg'),
                      const UserCardInfo(title: "¿Qué es el Agora?", text: "El Centro de desarrollo de negocios de la UPB, pone a disposición del ecositema emprendedor boliviano, un espacio para fortalecer la actitud emprendedora orientada a la innovación y el impacto en la comunidad.",),
                      const SizedBox(
                        height: 48.0,
                      ),
                      Container(
                        width: double.infinity, // Full width of the screen horizontally
                        color: ColorResourcees.grey_UPB.withOpacity(0.85), // White background with 50% opacity
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
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity, 
              color: ColorResourcees.grey_UPB.withOpacity(0.85),
              child: Text(
                "Alianzas",
                style: UpbTextStyle.getTextStyle("mh3", ColorResourcees.p_Yellow, "b"),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32,),
            accreditationsView,
            Container(
              width: double.infinity, // Full width of the screen horizontally
              color: ColorResourcees.grey_UPB.withOpacity(0.85), // White background with 50% opacity
              child: Text(
                "Nuestro Equipo",
                style: UpbTextStyle.getTextStyle("mh3", ColorResourcees.p_Yellow, "b"),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32,),
            members,
            UpbFooter()
          ],
        )),
      ),
    );
  }
}
