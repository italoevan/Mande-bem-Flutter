import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mandebem/widgets/CustomCard.dart';
import 'package:mandebem/widgets/IndexCard.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          child: Image.asset("images/background.jpeg",width: width,height: height,fit: BoxFit.cover,),
        ),
        Container(
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
                      CustomCard(context, "images/aristoteles.jpeg",false,pushNamed: '/aristoteles',),
                      CustomCard(context, "images/Darwin.jpg",false,pushNamed: '/aristoteles'),
                      CustomCard(context, "images/einstein.jpeg",true),
                      CustomCard(context, "images/socrates.png",true)
                    ],
                  )),
              Divider(),
              IndexCard(width, height, context)
            ],
          ),
        )),
      ],
    );
  }
}
