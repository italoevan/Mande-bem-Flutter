import 'package:flutter/material.dart';
import 'package:mande_bem_redacao/CustomRoutes.dart';
import 'package:mande_bem_redacao/screens/Home.dart';
import 'package:mande_bem_redacao/topicos/saude.dart';
import 'screens/SplashCustom.dart';

void main() {
  runApp(MaterialApp(
    title: "Mande Bem Redação",
    initialRoute: "/",
    routes: CustomRoutes().routes ,
    
    
  ));
}

