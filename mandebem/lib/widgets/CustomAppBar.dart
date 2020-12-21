import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar(this.context, this.controller, this.i);
  BuildContext context;
  PageController controller;
  int i;
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white24
        ),
        height: height / 14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
                icon: Icon(
                  Icons.home,
                  color: widget.i == 0 ? Colors.red : Colors.blue,
                  size: widget.i == 0 ? 29 : 20,
                ),
                onPressed: () {
                  widget.controller.jumpToPage(0);
                  setState(() {
                    widget.i = 0;
                  });
                  
                }),
            IconButton(
                icon: Icon(
                  Icons.book,
                  color: widget.i == 1 ? Colors.red : Colors.blue,
                  size: widget.i == 1 ? 29 : 20,
                ),
                onPressed: () {
                  widget.controller.jumpToPage(1);
                  setState(() {
                    widget.i = 1;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
