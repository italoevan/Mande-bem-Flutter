import 'package:flutter/material.dart';
import 'package:mande_bem_redacao/tabs/Dicas.dart';
import 'package:mande_bem_redacao/tabs/Index.dart';
import 'package:mande_bem_redacao/widgets/CustomBottom.dart';

class Home extends StatelessWidget {
  PageController _controller = PageController();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mande Bem Redação"),
        centerTitle: true,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [Index(), Dicas()],
      ),
      bottomNavigationBar: CustomBottom(_controller, i),
    );
  }
}
