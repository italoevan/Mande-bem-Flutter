import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MandeCitacao extends StatefulWidget {
  @override
  _MandeCitacaoState createState() => _MandeCitacaoState();
}

class _MandeCitacaoState extends State<MandeCitacao> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double witdh = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Mande Sua Citação"),
            SizedBox(
              width: 8,
            ),
            Icon(Icons.sms)
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'images/background.jpeg',
              fit: BoxFit.cover,
              height: height,
              width: witdh,
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
