import 'package:flutter/material.dart';
class card extends StatelessWidget {
  @override
  card({@required this.colour, this.cardChild,this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
