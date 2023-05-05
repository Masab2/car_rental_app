import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSpecs extends StatelessWidget {
  String text;
  Icon icon;

  CustomSpecs({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              tileMode: TileMode.mirror,
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: [Colors.blueGrey, Colors.white])),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          icon,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.0),
          )
        ],
      ),
    );
  }
}
