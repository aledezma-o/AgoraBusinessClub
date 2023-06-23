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
      //width: size.width * 0.95,

      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Wrap(
        children: <Widget>[
          InternationalAccreditationCard(
            text:
                "Financial Times \n #31 Mundial en Executive Educations \n #1 Latam en Growth \n #4 Latam en ranking general \n #3 Latam en Future use & Aims Achieved",
          ),
          InternationalAccreditationCard(
            text:
                "QS World University Ranking \n #5 Latam | Unico Executive MBA en Argentina \n #1 Empleabilidad en Sudamerica** \n #3 Executive Profile \n #4 ROI, Empleabilidad y Entrepreneurship & Alumni Outcomes** \n Executive MBA LATAM ranking.",
          ),
          InternationalAccreditationCard(
            text:
                "Top 10 LATAM \n #1 MBA Online en CEO Magazine \n #1 LATAM, Estrategia y Etica, MBAs Latinos, America Economia \n #4 Financial Times \n #4 MBA full-time en Ranking Eduniversal \n #1 En Argentina | #7 en Latam Ranking MBA America Ecomomia.",
          ),
        ],
      ),
    );
  }
}

class InternationalAccreditationCard extends StatelessWidget {
  const InternationalAccreditationCard({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Wrap(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            // ignore: prefer_const_literals_to_create_immutables
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
            child: Wrap(
              children: <Widget>[
                RichText(
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: text,
                        style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
