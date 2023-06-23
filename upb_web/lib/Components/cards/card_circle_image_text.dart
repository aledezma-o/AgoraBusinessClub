import 'package:flutter/material.dart';
import 'package:upb_web/Static_resources/color_resources.dart';
import 'package:upb_web/Static_resources/theme_data.dart';

class CircleImageTextCard extends StatelessWidget {
  const CircleImageTextCard({
    Key? key,
    required this.path,
    required this.text,
  }) : super(key: key);
  final String path;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                width: size.width * 0.035,
                height: size.width * 0.035,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(path),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      child: Text(text,
                          style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
                          textAlign: TextAlign.justify),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
