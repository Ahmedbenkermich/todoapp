// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

 
class Counter extends StatelessWidget {


final int totalNumber;
final int validNumber;

Counter({
    required this.totalNumber,
    required this.validNumber,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: Text(
        "$validNumber/$totalNumber",
        style: TextStyle(
          fontSize: 70,
          color: totalNumber==validNumber ? Colors.green : Colors.black ),
      ),
    );
  }
}