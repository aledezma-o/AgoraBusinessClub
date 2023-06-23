import 'package:flutter/material.dart';
import 'package:upb_web/Static_resources/color_resources.dart';
import 'package:upb_web/Static_resources/theme_data.dart';

class RankingsCard extends StatelessWidget {
  const RankingsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Wrap(
        children: const <Widget>[
          InternationalAccreditationCard(
            title: "Financial Times\n",
            text:
                "#31 Mundial en Executive Educations\n#1 Latam en Growth\n#4 Latam en ranking general\n#3 Latam en Future use & Aims Achieved",
          ),
          InternationalAccreditationCard(
            title: "QS World University Ranking\n",
            text:
                "#5 Latam | Unico Executive MBA en Argentina\n#1 Empleabilidad en Sudamerica**\n#3 Executive Profile\n#4 ROI, Empleabilidad y Entrepreneurship & Alumni Outcomes**\nExecutive MBA LATAM ranking.",
          ),
          InternationalAccreditationCard(
            title: "Top 10 LATAM\n",
            text:
                "#1 MBA Online en CEO Magazine\n#1 LATAM, Estrategia y Etica, MBAs Latinos, America Economia\n#4 Financial Times\n#4 MBA full-time en Ranking Eduniversal\n#1 En Argentina | #7 en Latam Ranking MBA America Ecomomia.",
          ),
        ],
      ),
    );
  }
}

class InternationalAccreditationCard extends StatelessWidget {
  const InternationalAccreditationCard({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.26,
      height: 200,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
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
      child: RichText(
        softWrap: true,
        textAlign: TextAlign.justify,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: text,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
