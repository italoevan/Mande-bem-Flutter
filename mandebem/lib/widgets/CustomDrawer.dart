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
        child: Column(
          children: [
            Center(
              child: Image.asset("images/enem_logo.png"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.star,
                color: Colors.deepOrange,
              ),
              title: Text(
                "Nos Avalie",
                style: TextStyle(fontSize: 22),
              ),
            ),
            ListTile(
              onTap:(){},
              title: Text("Mande sua citação!", style:TextStyle(fontSize: 22)),
              leading: Icon(Icons.lightbulb, color: Colors.orangeAccent,),
            )
          ],
        ),
      )),
    );
  }
}
