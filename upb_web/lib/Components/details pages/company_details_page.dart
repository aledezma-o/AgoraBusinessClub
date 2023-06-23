import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upb_web/Components/upb_scaffold.dart';

import 'company_details.dart';

class CompanyDetailPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String companyId;
  CompanyDetailPage(this.companyId);

  @override
  Widget build(BuildContext context) {
    return UpbScaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x3C8DBCFF), Color(0x3C8DBCFF)],
        ),
      ),
      child: FutureBuilder(
        future: _firestore.collection('company').doc(companyId).get(),
        builder: (context, snapshot) {
          // if video to ready to play, else show a progress bar to the user
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data?.data();
            return FractionallySizedBox(
                widthFactor: 0.75,
                heightFactor: 0.9,
                child: CompanyDetail(data));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }
}
