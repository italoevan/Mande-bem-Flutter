import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mandebem/model/Topics.dart';
import 'package:mandebem/screens/SplashCustom.dart';
import 'package:mandebem/topicos/saude.dart';

class IndexCard extends StatefulWidget {
  BuildContext context;
  IndexCard(this.width, this.height, this.context);
  double height;
  double width;

  @override
  _IndexCardState createState() => _IndexCardState();
}

class _IndexCardState extends State<IndexCard> {
  List<Topics> list = List();
  List<String> route = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    route = [
      '/frasesUsuarios',
      '/educacao',
      '/violencia',
      '/juventude',
      '/filosofos',
      '/sabedoria',
      '/trabalho',
    ];
    list = [
      Topics(
        "USUÁRIOS",
        isEspecial: true,
      ),
      Topics(
        "EDUCAÇÃO",
      ),
      Topics(
        "VIOLÊNCIA",
      ),
      Topics(
        "JUVENTUDE",
      ),
      Topics(
        "FILOSOFOS E AFINS",
      ),
      Topics(
        "SABEDORIA",
      ),
      Topics(
        "TRABALHO",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        height: widget.height /
            (113 /
                100), //Mexer pra deixar o indexCard de acordo com o bottomNavigation
        width: widget.width,
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.transparent,
                  ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(widget.context, route[index]);
                  },
                  child: Container(
                    width: widget.width,
                    height: widget.height / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: cores(index)),
                    ),
                    child: Center(
                        child: Text(list[index].topic,
                            style:
                                TextStyle(color: Colors.white, fontSize: 35))),
                  ),
                );
              }),
        ),
      ),
    );
  }

  List<Color> cores(int index) {
    if (list[index].isEspecial == null) {
      return [Color(0xff45a247), Color(0xff283c86)];
    } else {
      return [Color(0xff004ff9), Color(0xfffff94c)];
    }
  }
}
