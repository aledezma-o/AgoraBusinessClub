import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

class TitleBackgroud extends StatelessWidget {
  final String title;
  final String assetName ;

  const TitleBackgroud({ required this.title, required this.assetName } );

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Acme Logo'
    );
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          svg,
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(title, style: UpbTextStyle.getTextStyle("mh1", ColorResourcees.p_Yellow, "b"))),
              
        ],
      ),
    );
  }



}
