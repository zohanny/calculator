import 'package:flutter/material.dart';
import 'package:calculator/pages/calculate_resistance.dart';
import 'package:calculator/pages/old_main.dart';



void main() =>  runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const CalculateResistance(),
    '/old' : (context) => const Old(),
    //'name of the Rout': (context) => const MainMethod(),

  },

));
