import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  BuildContext context;
  String image;
  CustomCard(this.context, this.image);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(this.context).size.height;
    double width = MediaQuery.of(this.context).size.width;
    return Container(
        width: width / 3,
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              this.image,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
