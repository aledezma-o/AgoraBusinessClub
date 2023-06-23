import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upb_web/Components/iconPanel/logos_model.dart';
import '../../Components/iconPanel/icon_view.dart';
import '../../Components/iconPanel/titlePage.dart';
import '../../Components/iconPanel/upb_footer.dart';
import '../../Components/image_cover.dart';
import '../../Components/upb_scaffold.dart';
import 'package:upb_web/static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

import 'dart:convert';

import '../home/content_view.dart';

class MemberAgreementsPage extends StatelessWidget {
  late Future<String> future;
  String listPaths = "assets/routes/route_logos_list.json";
  late  Map<String, List<String>> routList ;


  MemberAgreementsPage() {}

  Future<String> readJsonFile(String listPaths) async {
    return await rootBundle.loadString(listPaths);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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

    return UpbScaffold(
        body: Container(
          child:Center(
            child:  ListView(
                children: [
                Container(
                  width: double.infinity, 
                  color: ColorResourcees.grey_UPB.withOpacity(0.85),
                  child: Text(
                    "Alianzas",
                    style: UpbTextStyle.getTextStyle("mh3", ColorResourcees.p_Yellow, "b"),
                    textAlign: TextAlign.center,
                  ),
                ),
                  //cover,
                  accreditationsView,
                  UpbFooter()
                ],
              )
            )
          ));

  }
}
