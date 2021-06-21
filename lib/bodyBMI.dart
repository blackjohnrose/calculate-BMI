import 'package:flutter/material.dart';

void main() {
  //runApp(MyApp());

  Human yourBmi = new Human(75, 1.75);
  var yourBmiIs = yourBmi.bodyBMI().toInt();

  if(yourBmiIs < 18)
    print('Under weight');

  if(yourBmiIs >= 18 && yourBmiIs < 25)
    print('Normal');

  if(yourBmiIs >= 25 && yourBmiIs < 35)
    print('Over Weight');

  if(yourBmiIs >= 35 )
    print('You are Fat!!!');
}

class Human {
  var width;
  var height;

  Human(this.width, this.height);

  double bodyBMI() {
    var bmi = this.width / (this.height * this.height);
    return bmi;
  }
}
