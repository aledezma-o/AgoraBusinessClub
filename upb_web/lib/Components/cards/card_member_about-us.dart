import 'package:flutter/material.dart';
import 'package:upb_web/Static_resources/color_resources.dart';
import 'package:upb_web/Static_resources/theme_data.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    required this.path,
    required this.member_title,
    required this.member_name,
  }) : super(key: key);
  final String path;
  final String member_title;
  final String member_name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.2,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(32),
      decoration: BoxDecoration(
          color: ColorResourcees.s_Blue,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Wrap(
            runAlignment: WrapAlignment.center,
            children: <Widget>[
              RichText(
                softWrap: true,
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: member_title + "\n",
                    style: UpbTextStyle.getTextStyle("b3", ColorResourcees.p_Yellow, "n"),
                  ),
                  TextSpan(
                    text: member_name,
                    style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
                  ),
                ]),
              )
            ],
          ),
          SizedBox(
            width: size.width * 0.2,
            height: size.height * 0.35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                path,
              ),
            ),
          )
        ],
      ),
    );
  }
}
