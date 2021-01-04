import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandebem/model/Frases.dart';

class Filosofos extends StatefulWidget {
  String appBarTitle;
  String filosofoImage;
  String filosofoNome;
  Widget contentAlert;
  Map<String, Frases> map = Map();

  Filosofos(
      {this.appBarTitle,
      this.filosofoImage,
      this.filosofoNome,
      this.contentAlert,
      this.map});

  @override
  _FilosofosState createState() => _FilosofosState();
}

class _FilosofosState extends State<Filosofos> {
  List<Frases> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.map
        .forEach((key, value) => list.add(Frases(value.texto, value.autor)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              "images/background.jpeg",
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              color: Colors.transparent,
              child: Container(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      color: Colors.transparent,
                      width: width,
                      height: height /5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              widget.filosofoImage,
                              width: width / 3.3,
                              height: height /6,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: widget.contentAlert,
                                      actions: [
                                        Row(
                                          children: [
                                            IconButton(
                                                icon: Icon(Icons.close),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                })
                                          ],
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.white.withOpacity(0.7)),
                              child: Center(
                                  child: Text(
                                "?",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 25),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    widget.filosofoNome,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height / 45),
                  Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      width: width,
                      height: height / 1.8,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(7)),
                      child: ListView.separated(
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onDoubleTap: () {
                                Clipboard.setData(ClipboardData(
                                    text:
                                        "\"${list[i].texto}\"\n${list[i].autor}"));
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content:
                                      Text("Salvo na área de transferência"),
                                ));
                              },
                              child: SizedBox(
                                height: height / 7,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                      list[i].texto,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, i) => Divider(
                                color: Colors.transparent,
                              ),
                          itemCount: list.length))
                ]),
              ))
        ],
      ),
    );
  }
}
