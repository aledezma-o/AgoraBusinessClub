import 'package:flutter/material.dart';

import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

class UserCardInfo extends StatelessWidget {
  const UserCardInfo({super.key, this.title, this.text});

  final title;
  final text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.85,
      color: Colors.white.withOpacity(0.1),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: UpbTextStyle.getTextStyle("mh3", ColorResourcees.s_Yellow, "b"),
              ),
              const SizedBox(height: 8.0),
              Text(
                text,
                style: UpbTextStyle.getTextStyle("h2", ColorResourcees.p_Blue, "l"),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
