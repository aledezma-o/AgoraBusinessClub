import 'package:flutter/material.dart';

import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

class PreviewCard extends StatelessWidget {
  PreviewCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description});
  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      height: 384,
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
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: Image.asset(
                imagePath,
                height: 60,
                width: 60,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: UpbTextStyle.getTextStyle(
                  "b1", ColorResourcees.p_Yellow, "n"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                description,
                style: UpbTextStyle.getTextStyle(
                    "b2", ColorResourcees.grey_UPB, "b"),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Aquí puedes incluir una acción al presionar el botón
              },
              child: const Text("Leer más"),
            ),
          ],
        ),
      ),
    );
  }
}
