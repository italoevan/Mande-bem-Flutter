import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  BuildContext context;
  double height;
  double width;
  Background(this.height, this.width);
  String image = 'images/background.jpeg';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: Image.asset(image,fit: BoxFit.cover,),
    );
  }
}
