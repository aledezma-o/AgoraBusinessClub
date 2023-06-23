import 'package:flutter/material.dart';
import 'package:upb_web/Static_resources/color_resources.dart';

import '../Static_resources/theme_data.dart';
import 'image_mosaic_text.dart';


class UserTestimonials extends StatelessWidget{

  UserTestimonials();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MosaicImageText(
            style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
            title: "Alejandro Ledezma\n",
            text:
                "Testimonio 1 de trabajo con la organizacion de la UPB en la que se realizaron distintos trabajos como: a, b y c",
            width: size.width * 0.2,
            path: "assets/img/carpincho.jpg",
          ),
          const Spacer(),
          MosaicImageText(
            style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
            title: "Gabriel Perez\n",
            text:
                "Testimonio 2 de trabajo con la organizacion de la UPB en la que se realizaron distintos trabajos como: a, b y c",
            width: size.width * 0.2,
            path: "assets/img/hamsters.jpg",
          ),
          const Spacer(),
          MosaicImageText(
            style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
            title: "Fabricio Fernandez\n",
            text:
                "Testimonio 3 de trabajo con la organizacion de la UPB en la que se realizaron distintos trabajos como: a, b y c",
            width: size.width * 0.2,
            path: "assets/img/gato.jpg",
          ),
          const Spacer(),
          MosaicImageText(
            style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
            title: "Fabricio Fernandez\n",
            text:
                "Testimonio 4 de trabajo con la organizacion de la UPB en la que se realizaron distintos trabajos como: a, b y c",
            width: size.width * 0.2,
            path: "assets/img/carpincho.jpg",
          ),
        ],
      ),
    );

  }

}