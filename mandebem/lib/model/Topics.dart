import 'package:flutter/material.dart';

class Topics extends StatefulWidget {
  String topic;
  String acao;
  Function function;
  bool isEspecial;
  Topics.vazio();
  Topics(this.topic,{this.isEspecial});
  BuildContext context;
  Route route;
  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  String get tpc {
    return widget.topic;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
