import 'package:flutter/material.dart';
import 'package:mandebem/tabs/Dicas.dart';
import 'package:mandebem/tabs/Index.dart';
import 'package:mandebem/widgets/CustomAppBar.dart';
import 'package:mandebem/widgets/CustomBottom.dart';
import 'package:mandebem/widgets/CustomDrawer.dart';

class Home extends StatelessWidget {
  PageController _controller = PageController();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Mande Bem Redação"),
        centerTitle: true,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [Index(),Dicas()],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.shop_rounded),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomAppBar(context, _controller, i)
    
    );
  }
}
