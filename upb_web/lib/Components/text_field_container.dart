import 'package:flutter/material.dart';
import '../static_resources/color_resources.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width*0.8,
      decoration: BoxDecoration(
        color: ColorResourcees.s_Yellow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: child,
    );
  }
}