import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Components/cards/preview_card.dart';
import '../../Components/image_mosaic_text.dart';
import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';


class ContentView extends StatelessWidget {
  ContentView({super.key, required this.content});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String content;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
            future: _firestore.collection('content').where("type", isEqualTo: content).get(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.done)
              {
                if (snapshot.hasError) {
                  return const Text('Error al cargar los datos');
                }
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final data = snapshot.data!;
                var dataList = data.docs.map((doc) => doc.data()).toList();
                List<Widget> widgetList = [];
                if(content == "events"){
                  dataList.forEach((element) { widgetList.add(PreviewCard(
                      imagePath: element['image'],
                      title: element['name'],
                      description: element['description']));
                  });
                }else{
                  dataList.forEach((element) { widgetList.add(MosaicImageText(
                    style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
                    title: element['name'],
                    text:element['description'],
                    width: size.width * 0.2,
                    path: element['image'],),);
                  });

                }
                return Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: widgetList,
                );
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            }
            );
  }
  getData(String content){
    return _firestore.collection('content').snapshots();
  }
}