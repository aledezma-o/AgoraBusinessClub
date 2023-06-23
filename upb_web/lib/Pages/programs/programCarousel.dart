import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ProgramCarousel extends StatefulWidget {
  final List<Map<String, dynamic>> programList;
  const ProgramCarousel(  {required  this.programList, super.key});


  @override
  _ProgramCarouselState createState()=>_ProgramCarouselState();
}

class _ProgramCarouselState extends State<ProgramCarousel> {
  int _selectedIndex = -1;
  List<Map<String, dynamic>> programList = [];

  @override
  void initState() {
    super.initState();
    programList = widget.programList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 860,
          child: Center(
            child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 40,
              crossAxisSpacing: 24
            ),
              itemCount: programList.length,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, dynamic> data = programList[index];
                return GestureDetector(
                  onTap: () {
                    downloadPDF(data["documentUrl"]);
                  },
                  child: MouseRegion(
                    onHover: (event) {
                      setState(() {
                        _selectedIndex = index;
                      });
                      },
                    onExit: (event) {
                      setState(() {
                        _selectedIndex = -1;
                      });
                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 360,
                              height: 360,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                  image:  DecorationImage(
                                      image: AssetImage(data["image"]),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            if (_selectedIndex == index)
                              Container(
                                width: 320,
                                height: 320,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                                child: Center(
                                  child: Text(
                                    data['introduction'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          data['title'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                },
            ),
          ),

    );
  }
  Future<void> downloadPDF(String pdfURL) async {
    final ref = FirebaseStorage.instance.refFromURL(pdfURL);
    final bytes = await ref.getData();

    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/documento.pdf');
    await file.writeAsBytes(bytes as List<int>);
  }

}
