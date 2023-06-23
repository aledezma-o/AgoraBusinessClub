import 'package:flutter/material.dart';

import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

class UpbFooter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 32, left: 12),
      color: Colors.grey[300],
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text("Contact Us", style: UpbTextStyle.getTextStyle("d1", ColorResourcees.p_Yellow, "b")),
               Row(
                 children: [
                   Icon(Icons.phone,color: ColorResourcees.p_Blue),
                   SizedBox(width: 12),
                   Text("+591 775-19190",style: UpbTextStyle.getTextStyle("d2", ColorResourcees.p_Blue, "n"))
                 ]),
              Row(
                 children: [
                   Icon(Icons.mail, color: ColorResourcees.p_Blue),
                   SizedBox(width: 12),
                   Text("sgarciaagreda@upb.edu",style: UpbTextStyle.getTextStyle("d2", ColorResourcees.p_Blue, "n"))
                 ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text("Encuentranos en:", style: UpbTextStyle.getTextStyle("d1", ColorResourcees.p_Yellow, "b")),
               Row(
                 children: [
                   Icon(Icons.map,color: ColorResourcees.p_Blue),
                   SizedBox(width: 12),
                   Text("Campus UPB. Cochabamba, Bolivia. \n Edificio postgrado en el segundo piso, oficina de internacionalización.\n Av. Capitán Ustariz Km. 6,5.",
                       style: UpbTextStyle.getTextStyle("d2", ColorResourcees.p_Blue, "n"))
                 ]
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text("Director de internacionalización postgrado", style: UpbTextStyle.getTextStyle("d1", ColorResourcees.p_Yellow, "b")),
                  Row(
                      children: [
                        Icon(Icons.person,color: ColorResourcees.p_Blue),
                        SizedBox(width: 12),
                        Text("Sergio García Agreda Ph.D.",
                            style: UpbTextStyle.getTextStyle("d2", ColorResourcees.p_Blue, "n"))
                 ]
                ),
            ],
          )
          )
        ],
      )
    );
   }

}

