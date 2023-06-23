import 'package:flutter/material.dart';
import 'package:upb_web/Static_resources/color_resources.dart';

class BlueSquaresWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/events");
                },
                child: _buildSquare('EVENTOS', ColorResourcees.p_Blue),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/news");
                },
                child: _buildSquare('NOTICIAS', ColorResourcees.p_Blue),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/programs");
                },
                child: _buildSquare('PROGRAMAS', ColorResourcees.p_Blue),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/member-agreements");
                },
                child: _buildSquare('CONVENIOS', ColorResourcees.p_Blue),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/about-us");
                },
                child: _buildSquare('SOBRE NOSOTROS', ColorResourcees.p_Blue),
              ),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildSquare(String text, Color color) {
    return Container(
      width: 250,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 3),
            blurRadius: 7,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
