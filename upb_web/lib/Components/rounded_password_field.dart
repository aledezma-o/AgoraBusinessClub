import 'package:flutter/material.dart';
import 'package:upb_web/Components/text_field_container.dart';

import '../static_resources/color_resources.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  const RoundedPasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: ColorResourcees.grey_UPB,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: ColorResourcees.grey_UPB,
          ),
          border: InputBorder.none
        ),
      )
    );
  }
}