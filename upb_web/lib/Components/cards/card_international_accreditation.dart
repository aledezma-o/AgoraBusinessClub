import 'package:flutter/material.dart';
import 'package:upb_web/Static_resources/color_resources.dart';
import 'package:upb_web/Static_resources/theme_data.dart';

class InternationalAccreditation extends StatelessWidget {
  const InternationalAccreditation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width * 0.25,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
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
        textAlign: TextAlign.center,
        text:  TextSpan(
          children: [
            TextSpan(
              text: "🌎 \n\n Acreditaciones Internacionales",
              style: UpbTextStyle.getTextStyle("b2", ColorResourcees.light_Blue, "n"),
            ),
          ],
        ),
      ),
    );
  }
}
