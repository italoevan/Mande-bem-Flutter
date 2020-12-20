import 'package:flutter/material.dart';

class CustomBottom extends StatefulWidget {
  PageController controller;
  int i;
  CustomBottom(this.controller, this.i);
  @override
  _CustomBottomState createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      backgroundColor: Colors.white30,
      currentIndex: widget.i,
      onTap: (num) {
        setState(() {
          print(num);
          widget.i = num;
          widget.controller.jumpToPage(num);
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Dicas")
      ],
    );
  }
}
