import 'package:flutter/material.dart';
import 'package:upb_web/Components/upb_app_bar.dart';
import 'package:upb_web/Static_resources/color_resources.dart';
import 'package:upb_web/Static_resources/theme_data.dart';

class UpbScaffold extends StatelessWidget {
  final Widget body;

  UpbScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UpbAppBar(title: "UpbAppBar",),
        body: Stack(
          children: [background, body],
        ),

    );
  }

  final Container background = Container(
    child: Image.asset(
      '../assets/img/TextureBackground.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    ),
  );


}
