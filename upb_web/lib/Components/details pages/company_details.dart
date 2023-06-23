import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

class CompanyDetail extends StatelessWidget {
  final storageRef = FirebaseStorage.instance.ref();
  late String url;
  final companyData;

  CompanyDetail(this.companyData);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final companyName = Container(
        child: Text(companyData["name"],
            style:
                UpbTextStyle.getTextStyle('b1', ColorResourcees.p_Blue, 'b')));

    final companyCity = Container(
        child: Text(companyData["city"],
            style:
                UpbTextStyle.getTextStyle('b2', ColorResourcees.p_Blue, 'b')));
    final companyImage = FutureBuilder(
      future: FirebaseStorage.instance
          .ref(companyData["photo"])
          .getDownloadURL(), //storageRef.child(companyData["photo"]).getDownloadURL(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Container(
                width: screenSize.width,
                height: 300,
                child: Image.network(
                  snapshot.data.toString(),
                  fit: BoxFit.cover,
                )),
          );
          // CustomImage( path:snapshot.data.toString(), width: screenSize.width, height: 400 );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    final companyManagerAndIndustry = Text(companyData["manager_id"] +
        " is the manager and they are dedicated to: " +
        companyData["industry"]);

    return Container(
        decoration: const BoxDecoration(color: ColorResourcees.s_white),
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            companyName,
            companyCity,
            companyImage,
            companyManagerAndIndustry
          ],
        ));
  }
}
