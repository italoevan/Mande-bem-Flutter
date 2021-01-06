import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandebem/model/Frases.dart';
import 'package:mandebem/widgets/Background.dart';

class FrasesUsuarios extends StatefulWidget {
  @override
  _FrasesUsuariosState createState() => _FrasesUsuariosState();
}

class _FrasesUsuariosState extends State<FrasesUsuarios> {
  List<Frases> list = List();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData().then((value) {
      list = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Frases dos Usuários"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Background(height, width),
            Container(
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                      child: FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasData) {
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    height: height / 6.9,
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
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
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
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: list.length);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<List<Frases>> getData() async {
    var value = await firestore.collection('frases_usuarios').limit(15).get();
    Map<String, dynamic> map = {};
    List<Frases> internList = List();
    value.docs.forEach((element) {
      map = element.data();
      internList.add(Frases(map['frase'], map['autor']));
    });
    return internList;
  }
}
