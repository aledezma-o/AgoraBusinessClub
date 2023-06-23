import 'package:flutter/material.dart';
import 'package:upb_web/Static_resources/color_resources.dart';
import 'package:upb_web/Static_resources/theme_data.dart';

class TitleTextCard extends StatelessWidget {
  const TitleTextCard({
    Key? key,
    required this.title,
    required this.text,
    required this.width,
  }) : super(key: key);
  final String title;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorResourcees.light_Yellow,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Container(
            width: this.width,
            padding: EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorResourcees.s_white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              runAlignment: WrapAlignment.center,
              children: <Widget>[
                Container(
                  //width: this.width,
                  padding: EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: ColorResourcees.p_Blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Wrap(
                    children: <Widget>[
                      RichText(
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        text: TextSpan(children: [
                          TextSpan(
                            text: title,
                            style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                RichText(
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  text: TextSpan(children: [
                    TextSpan(
                      text: text,
                      style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
