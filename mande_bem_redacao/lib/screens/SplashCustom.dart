import 'dart:async';

import 'package:flutter/material.dart';

import 'Home.dart';

class SplashCustom extends StatefulWidget {
  @override
  _SplashCustomState createState() => _SplashCustomState();
}

class _SplashCustomState extends State<SplashCustom> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () { passarTela();});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Mande Bem Redação"),
      ),
    );
  }

  void passarTela() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
      return Home();
    }));
  }
}
