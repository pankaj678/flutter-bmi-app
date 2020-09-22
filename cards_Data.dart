import 'package:flutter/material.dart';

class cardData extends StatelessWidget {
  cardData({this.text,this.icon});
  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(
          height: 20,
        ),
        Text(text,style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98)),
        ),
      ],
    );
  }
}
