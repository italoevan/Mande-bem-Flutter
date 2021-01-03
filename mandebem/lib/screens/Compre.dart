import 'dart:async';

import 'package:flutter/material.dart';

class Compre extends StatefulWidget {
  @override
  _CompreState createState() => _CompreState();
}

class _CompreState extends State<Compre> {
  bool animation = true;
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Compre"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Image.asset("images/compre.png"),
            Expanded(
                child:Container(
             
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Adquira a versão PRO!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.all(32)),
                  Text(
                    "* SEM ANÚNCIOS!!",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                   Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "* TODOS OS TÓPICOS\n DESBLOQUEADOS",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Padding(padding: EdgeInsets.all(25)),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Text("ADQUIRIR",
                          style: TextStyle(color: Colors.white, fontSize: 19)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
