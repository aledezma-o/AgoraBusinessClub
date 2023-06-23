import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Components/image_mosaic_text.dart';
import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

class AssociationList extends StatelessWidget {

  String listPaths = "assets/routes/route_logos_list.json";
  Future<String> readJsonFile(String listPaths) async {
    return await rootBundle.loadString(listPaths);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
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
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        width: size.width * 0.87,
        child: FutureBuilder(
            future: readJsonFile(listPaths),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.done)
              {
                Map<String, dynamic> routeLists = jsonDecode(snapshot.data!);
                List<dynamic> associationData = routeLists['association'] as List<dynamic>;
                List<MosaicImageText> associationWidgets = [];

                for (var value in associationData) {
                  associationWidgets.add(MosaicImageText(
                    style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
                    title: value["title"],
                    text: value["description"],
                    width: size.width * 0.2,
                    path: value["logo"],
                  ));
                }
                return Wrap(
                  children: associationWidgets,
                );
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            }
            ),
      )
    );
  }
}
