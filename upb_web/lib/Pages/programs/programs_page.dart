import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upb_web/Components/iconPanel/icon_view.dart';
import 'package:upb_web/Pages/programs/programCarousel.dart';
import '../../Components/cards/card_international_accreditation.dart';
import '../../Components/cards/card_ranking.dart';
import '../../Components/customPainter/title_backgroud.dart';
import '../../Components/iconPanel/logos_model.dart';
import '../../Components/iconPanel/titlePage.dart';
import '../../Components/iconPanel/upb_footer.dart';
import '../../Components/image_cover.dart';
import '../../Components/upb_scaffold.dart';
import '../../Components/userTestimonials.dart';
import '../home/content_view.dart';

class ProgramsPage extends StatelessWidget {


  String listPaths = "assets/routes/route_logos_list.json";
  late List<Map<String, dynamic>> programsList = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ScrollController controller = ScrollController();

  ProgramsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    // final cover = CoverImage(
    //   height: size.height * 0.5,
    //   width: size.width * 0.85,
    //   path: "assets/img/header_images/header_programas.jpg",
    // );

    final programCarousel = FutureBuilder(
      future:  _firestore.collection("programs").get(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error al cargar los datos');
          }
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final data = snapshot.data!;
          programsList = data.docs.map((doc) => doc.data()).toList();
          return Container(
              padding: const EdgeInsets.symmetric( horizontal: 200),
              child: ProgramCarousel(programList: programsList));
        }
        else {
          return const CircularProgressIndicator();
        }
      }
    );
    return UpbScaffold(
        body: Container(
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TitlePage( title: "Programas"),
                        //cover,
                        programCarousel,
                        UpbFooter()
                      ]
                  ),
                ),
            ))
    );

  }
   Future<String> readJsonFile(String listPaths) async {
    return await rootBundle.loadString(listPaths);
  }
}
