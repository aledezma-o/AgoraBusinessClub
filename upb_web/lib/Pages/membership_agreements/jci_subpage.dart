import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upb_web/Components/iconPanel/logos_model.dart';
import '../../Components/iconPanel/icon_view.dart';
import '../../Components/iconPanel/titlePage.dart';
import '../../Components/iconPanel/upb_footer.dart';
import '../../Components/image_cover.dart';
import '../../Components/upb_scaffold.dart';

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
            List<dynamic> titleAgreements = routeLists['JCI'] as List<dynamic>;
            List<LogoModel> agreementsList = titleAgreements.map((agreement) => LogoModel(
              title: agreement['title'] as String,
              logo: agreement['logo'] as String,
              link: agreement['link'] as String,
            )).toList();
            return Column(
              children: [
                IconView(
                  titleView: "JCI",
                  routList: agreementsList,
                ),
              ],
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
       }});
    return UpbScaffold(
        body: Container(
          child:Center(
            child:  ListView(
                children: [
                  const TitlePage( title: "JCI"),
                  //cover,
                  accreditationsView,
                  UpbFooter()
                ],
              )
            )
          ));

  }
}
