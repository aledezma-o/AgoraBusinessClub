import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upb_web/Pages/events/association_list.dart';
import '../../Components/iconPanel/titlePage.dart';
import '../../Components/iconPanel/upb_footer.dart';
import '../../Components/upb_scaffold.dart';

import 'package:upb_web/Components/image_cover.dart';
import 'package:upb_web/Components/cards/card_ranking.dart';
import 'package:upb_web/Components/cards/card_international_accreditation.dart';
import '../../Components/video_player.dart';
import '../home/content_view.dart';

class EventsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<dynamic> newsObjects = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final cover = CoverImage(
      height: size.height * 0.5,
      width: size.width * 0.85,
      path: "assets/img/Campus.jpg",
    );
    final association = AssociationList();

    final experienceVideo = Container(
      width: size.width * 0.65,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: VideoPlayerApp( videoId: 'videos/SpotBolivia.mp4',)
    );
    //
    //
    return UpbScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TitlePage( title: "Eventos"),
              cover,
              association,
              const InternationalAccreditation(),
              const RankingsCard(),
              ContentView(content: 'testimonials'),
              experienceVideo,
              UpbFooter()
            ],
          ),
        ),
      ),
    );
  }
}
