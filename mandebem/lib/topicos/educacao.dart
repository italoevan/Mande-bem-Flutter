import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:mandebem/model/Frases.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Educacao extends StatefulWidget {
  @override
  _EducacaoState createState() => _EducacaoState();
}

class _EducacaoState extends State<Educacao> {
  List<Frases> list = List();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    list = [
      Frases(
          "Ensinar não é transferir conhecimento, mas criar as possibilidades para a sua própria produção ou a sua construção.",
          "- PAULO FREIRE"),
      Frases(
          "Se a educação sozinha não transforma a sociedade, sem ela tampouco a sociedade muda.",
          "- PAULO FREIRE"),
      Frases("TESTE", "- TESTE DE AUTOR"),
      Frases("TESTE", "- TESTE DE AUTOR"),
      Frases("TESTE", "- TESTE DE AUTOR"),
      Frases("TESTE", "- TESTE DE AUTOR"),
      Frases("TESTE", "- TESTE DE AUTOR"),
      Frases("TESTE", "- TESTE DE AUTOR")
    ];
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () => showAlert(context));
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Educação"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Image.asset("images/background.jpg",
                width: width, height: height, fit: BoxFit.cover),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                height: height / 1.4,
                width: width / 1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff45a247), Color(0xff283c86)])),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onDoubleTap: () {
                          Clipboard.setData(ClipboardData(
                              text: "\"" +
                                  list[index].texto +
                                  "\"" +
                                  " \n" +
                                  list[index].autor));
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Row(
                            children: [
                              Text("Copiado para área de transferência"),
                              SizedBox(
                                width: width / 8,
                              ),
                              Icon(Icons.done)
                            ],
                          )));
                        },
                        child: Container(
                          height: height / 6.9,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.white),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  child: Text(
                                    list[index].texto,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(list[index].autor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: list.length),
              ),
            )
          ],
        ));
  }

  void showAlert(BuildContext context) {
    showDialog(
        child: Container(
            child: AlertDialog(
          content: Text(
              "De dois cliques para salvar a citação na área de transferência."),
        )),
        context: context);
  }

  
}
