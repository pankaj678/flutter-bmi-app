import 'package:bmi/cards_Data.dart';
import 'package:bmi/icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cards_Data.dart';
import 'result_page.dart';
import 'icon_button.dart';
import 'bmi_calculator.dart';

const bottomContainerHeight = 60.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum gender {
  male,
  female,
}

class inputPage extends StatefulWidget {
  @override
  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  gender selectedGender;

  var maleCardColor = inactiveCardColor;
  var femaleCardColor = inactiveCardColor;
  int height = 180;
  int weight = 60;
  int age=25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: card(
                      onPress: () {
                        setState(() {
                          selectedGender = gender.male;
                        });
                      },
                      colour: selectedGender == gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: cardData(
                        text: 'MALE',
                        icon: Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                      )),
                ),
                Expanded(
                  child: card(
                    onPress: () {
                      setState(() {
                        selectedGender = gender.female;
                      });
                    },
                    colour: selectedGender == gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: cardData(
                      text: 'FEMALE',
                      icon: Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: card(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(fontSize: 80),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Slider(
                    min: 120,
                    max: 220,
                    value: height.toDouble(),
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: card(
                    colour: activeCardColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98),),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(fontSize: 70),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButtonData(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            IconButtonData(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: card(colour: activeCardColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98),),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(fontSize: 70),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButtonData(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButtonData(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BmiCalculator calc= BmiCalculator(weight: weight,height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                 builder: (context){
                   return result(
                     bmi: calc.bmiCalc(),
                     text: calc.getResult(),
                     interpretation: calc.interpretation(),
                   );
                 },
                ),
              );
            },
            child: Container(
                height: bottomContainerHeight,
                width: double.infinity,
                color: bottomContainerColor,
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                    child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 18),
                )),
                margin: EdgeInsets.only(top: 10)),
          ),
        ],
      ),
    );
  }
}
