import 'package:flutter/material.dart';
import 'package:mande_bem_redacao/tabs/Dicas.dart';
import 'package:mande_bem_redacao/tabs/Index.dart';
import 'package:mande_bem_redacao/widgets/CustomAppBar.dart';
import 'package:mande_bem_redacao/widgets/CustomBottom.dart';
import 'package:mande_bem_redacao/widgets/CustomDrawer.dart';

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
      floatingActionButton: FloatingActionButton(onPressed: (){},),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomAppBar(context, _controller, i)
    
    );
  }
}
