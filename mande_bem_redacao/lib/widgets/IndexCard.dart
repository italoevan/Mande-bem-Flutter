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
  List<Route> route = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    list = [
      Topics(
        "Teste",
      ),
      Topics(
        "Salve",
      )
    ];
    route = [
      MaterialPageRoute(builder: (context) => Saude()),
      MaterialPageRoute(builder: (context) => SplashCustom())
    ];
    return Container(
      height: this.widget.height,
      width: this.widget.width,
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
                onTap: () => Navigator.push(widget.context, route[index]),
                child: Container(
                  width: widget.width,
                  height: widget.height / 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.red,
                  ),
                  child: Text(list[index].topic),
                ),
              );
            }),
      ),
    );
  }
}
