import 'package:flutter/material.dart';
import 'package:upb_web/Static_resources/color_resources.dart';

class CoverImage extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  const CoverImage({
    Key? key,
    required this.path,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width,//size.width * 0.85,
      height: height,
      //margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            path,
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
