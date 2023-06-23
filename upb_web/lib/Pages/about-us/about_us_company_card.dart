import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

class AboutUsCompanyCard extends StatelessWidget {
  final auCompanyId;
  final Map<String, dynamic> auCompanyData;
  const AboutUsCompanyCard(this.auCompanyId, this.auCompanyData);

  @override
  Widget build(BuildContext context) {
    print("COMPANY CARD \n===================================");
    Size size = MediaQuery.of(context).size;
    final FirebaseStorage storage = FirebaseStorage.instance;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/company/$auCompanyId");
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            width: constraints.maxWidth * 0.65,
            decoration: BoxDecoration(
              color: ColorResourcees.s_Blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.2,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorResourcees.s_white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FutureBuilder(
                    future: FirebaseStorage.instance
                        .ref()
                        .child(auCompanyData["photo"])
                        .getDownloadURL(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Image.network(
                          snapshot.data.toString(),
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Image.asset(
                          '../assets/img/placeholder.png',
                          fit: BoxFit.cover,
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: size.width * 0.3,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorResourcees.s_white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          auCompanyData["name"],
                          style: UpbTextStyle.getTextStyle(
                              'b2', ColorResourcees.p_Blue, 'b'),
                        ),
                        Text(
                          "From: " +
                              auCompanyData["city"] +
                              ", works with " +
                              auCompanyData["industry"],
                          style: UpbTextStyle.getTextStyle(
                              'b3', ColorResourcees.p_Yellow, 'l'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
