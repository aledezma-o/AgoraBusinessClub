import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upb_web/Components/iconPanel/logos_model.dart';
import 'package:upb_web/Static_resources/theme_data.dart';
import 'package:upb_web/static_resources/color_resources.dart';

import 'icon_item.dart';

class IconView extends StatelessWidget{

  final List<Widget> iconsWidgetsList= [];
  final List<LogoModel> routList;
  final String titleView;

  IconView({required this.titleView, required this.routList}){
    for (int i = 0; i < routList.length; i++) {
      iconsWidgetsList.add(Iconitem(iconDetails: routList[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.all(12),
    decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: Text(titleView,  style: UpbTextStyle.getTextStyle("h2", ColorResourcees.p_Blue, "n"))),
        Center(
            child: Wrap(
                spacing: 14.0,
                runSpacing: 12.0,
                children: iconsWidgetsList
            )
        ),
      ]
    ));
  }

}