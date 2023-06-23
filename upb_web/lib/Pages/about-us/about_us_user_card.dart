import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../Static_resources/theme_data.dart';
import '../../Static_resources/color_resources.dart';

class AboutUsCard extends StatelessWidget {
  final auUserId;
  final Map<String, dynamic> auUserData;
  const AboutUsCard(this.auUserId, this.auUserData);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // auData["newsTitle"]
    return Card(
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Container(
                width: size.width * 0.035,
                height: size.width * 0.035,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorResourcees.s_white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder(
                  future: FirebaseStorage.instance
                      .ref()
                      .child(auUserData["photo"])
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      child: Text(
                          auUserData["first_name"] +
                              ' ' +
                              auUserData["last_name"] +
                              ', con foto: \n' +
                              auUserData["photo"] +
                              ', e ID: ' +
                              auUserId.toString(),
                          style: UpbTextStyle.getTextStyle("b3", ColorResourcees.light_Blue, "n"),
                          textAlign: TextAlign.justify),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
