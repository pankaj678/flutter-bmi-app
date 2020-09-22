import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cards.dart';

const bottomContainerHeight = 60.0;
const bottomContainerColor = Color(0xFFEB1555);


class result extends StatelessWidget {

  result({@required this.bmi,@required this.interpretation,@required this.text});

  final String bmi;
  final String interpretation;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 18),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: card(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(text.toUpperCase(),style: TextStyle(fontSize: 25),),
                  Text(bmi,style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold),),
                  Text(interpretation.toUpperCase(),style: TextStyle(fontSize: 22),),
                ],
              )
            ),
          ),
          GestureDetector(
            onTap: () {
             Navigator.pop(context) ;
            },
            child: Container(
                height: bottomContainerHeight,
                width: double.infinity,
                color: bottomContainerColor,
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                    child: Text(
                      'RE-CALCULATE',
                      style: TextStyle(fontSize: 18),
                    )),
                margin: EdgeInsets.only(top: 10)),
          ),
        ],

      ),
    );
  }
}
