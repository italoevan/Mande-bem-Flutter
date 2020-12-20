import 'package:flutter/cupertino.dart';
import 'package:mande_bem_redacao/screens/SplashCustom.dart';
import 'package:mande_bem_redacao/topicos/saude.dart';

class CustomRoutes{
  Map<String, Widget Function(BuildContext)> routes =  {
      '/' : (context) => SplashCustom(),
      '/saude' : (context) => Saude()

    };


}