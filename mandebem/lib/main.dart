import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandebem/CustomRoutes.dart';
import 'package:mandebem/screens/Home.dart';
import 'package:mandebem/topicos/saude.dart';
import 'screens/SplashCustom.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
       runApp(MaterialApp(
    title: "Mande Bem Redação",
    initialRoute: "/",
    routes: CustomRoutes().routes,
    theme: ThemeData(primaryColor: Color(0xff0e0e7d)),
  ));
    });
 
}
