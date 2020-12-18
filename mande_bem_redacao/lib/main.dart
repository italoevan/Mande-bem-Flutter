import 'package:flutter/material.dart';
import 'package:mande_bem_redacao/screens/Home.dart';
import 'screens/SplashCustom.dart';

void main() {
  runApp(MaterialApp(
    title: "Mande Bem Redação",
    theme: ThemeData(
      cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(
  Radius.circular(8.0),

  )))),
    home: SplashCustom(),
  ));
}

