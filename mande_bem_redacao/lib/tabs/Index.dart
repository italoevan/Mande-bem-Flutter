import 'package:flutter/material.dart';
import 'package:mande_bem_redacao/widgets/CustomCard.dart';
import 'package:mande_bem_redacao/widgets/IndexCard.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset("images/background.jpg", fit: BoxFit.cover, width: width,height: height,),
        Container(
            padding: EdgeInsets.only(right: width / 50, left: width / 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Grandes Nomes",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Divider(),
                  Container(
                      height: height / 6,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CustomCard(context, "images/aristoteles.jpeg"),
                          CustomCard(context, "images/Darwin.jpg"),
                          CustomCard(context, "images/einstein.jpeg"),
                          CustomCard(context, "images/socrates.png")
                        ],
                      )),
                  Divider(),
                 IndexCard(width, height,context)
                ],
              ),
            )),
      ],
    );
  }
}
