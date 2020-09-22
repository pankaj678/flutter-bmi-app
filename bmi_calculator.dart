import 'dart:math';

import 'package:flutter/cupertino.dart';
class BmiCalculator {

  BmiCalculator({@required this.weight,@required this.height});

    int height=0;
    int weight=0;
    double _bmi =0.0;

  String bmiCalc(){
     _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return('Overweight');
    }
    else if(_bmi>18.5){
      return('Normal');
    }
    else{
      return('Underweight');
    }
  }

  String interpretation(){
    if(_bmi>=25){
      return('You Have Higher Than Normal Body Weight, Try To Exercise More');
    }
    else if(_bmi>18.5){
      return('You Have Normal Body Weight, Good Job');
    }
    else{
      return('You Have Lower Than Normal Body Weight, You Can Eat More');
    }

  }
}