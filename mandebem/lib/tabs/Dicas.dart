import 'package:flutter/material.dart';

class Dicas extends StatefulWidget {
  @override
  _DicasState createState() => _DicasState();
}

class _DicasState extends State<Dicas> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset("images/background.jpg", height: height,width: width,fit: BoxFit.cover,)
      ],
    );
  }
}
