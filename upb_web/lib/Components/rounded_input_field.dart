import 'package:flutter/material.dart';
import 'package:upb_web/Components/text_field_container.dart';
import '../static_resources/color_resources.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorResourcees.grey_UPB,
          ),
          hintText: hintText,
          border: InputBorder.none
        ),
      ),
    );
  }
}