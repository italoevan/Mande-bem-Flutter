import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mande_bem_redacao/model/Topics.dart';
import 'package:mande_bem_redacao/screens/SplashCustom.dart';
import 'package:mande_bem_redacao/topicos/saude.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    list = [
      Topics(
        "Teste",
      ),
      Topics(
        "Salve",
      ),
      Topics(
        "Salve",
      ),
      Topics(
        "Salve",
      ),
      Topics(
        "Salve",
      ),
      Topics(
        "Salve",
      ),
    ];
    route = [
      '/saude',
      '/',
      '/saude',
      '/saude',
      '/saude',
      '/saude',
    ];
    return Container(
      height: widget.height,
      width: widget.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.separated(
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
                  height: widget.height / 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff45a247), Color(0xff283c86)]),
                  ),
                  child: Text(list[index].topic),
                ),
              );
            }),
      ),
    );
  }
}
