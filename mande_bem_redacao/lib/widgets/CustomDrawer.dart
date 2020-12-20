import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              onTap: (){

              },
              leading: Icon(Icons.star, color: Colors.deepOrange,),
              title: Text("Nos Avalie", style: TextStyle(fontSize: 22),),
             
            )
          ],
        ),
      )),
    );
  }
}
