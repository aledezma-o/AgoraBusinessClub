import 'package:flutter/material.dart';
import 'package:upb_web/Static_resources/color_resources.dart';
import 'package:upb_web/Static_resources/theme_data.dart';

class MosaicImageText extends StatelessWidget {
  final String path;
  final String text;
  final String title;
  final TextStyle style;
  final double width;
  //final double height;
  const MosaicImageText({
    Key? key,
    required this.path,
    required this.text,
    required this.title,
    required this.style,
    required this.width,
    //required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      width: width,
      decoration: BoxDecoration(
        color: ColorResourcees.s_white, // Fill Mosaico
        border: Border.all(
          color: ColorResourcees.grey_UPB, // Borde Mosaico
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              path,
              width: width,
              height: width,
            ),
          ),
          Container(
            width: this.width,
            padding: EdgeInsets.all(8),
            margin: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
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
              runAlignment: WrapAlignment.center,
              children: <Widget>[
                RichText(
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  text: TextSpan(children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                        text: text,
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
