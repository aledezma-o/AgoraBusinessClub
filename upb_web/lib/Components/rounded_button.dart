import 'package:flutter/material.dart';
import 'package:upb_web/static_resources/color_resources.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = ColorResourcees.p_Blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      width: size.width*0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}