import 'package:flutter/cupertino.dart';
import 'package:mandebem/screens/SplashCustom.dart';
import 'package:mandebem/topicos/educacao.dart';
import 'package:mandebem/topicos/saude.dart';

class CustomRoutes{
  Map<String, Widget Function(BuildContext)> routes =  {
      '/' : (context) => SplashCustom(),
      '/saude' : (context) => Saude(),
      '/educacao' :(context) =>Educacao()

    };


}