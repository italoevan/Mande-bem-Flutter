import 'package:flutter/cupertino.dart';
import 'package:mandebem/filosofos/filosofos.dart';
import 'package:mandebem/model/Frases.dart';
import 'package:mandebem/screens/Cadastro.dart';
import 'package:mandebem/screens/Compre.dart';
import 'package:mandebem/screens/Login.dart';
import 'package:mandebem/screens/MandeCitacao.dart';
import 'package:mandebem/screens/Settings.dart';
import 'package:mandebem/screens/SplashCustom.dart';
import 'package:mandebem/topicos/educacao.dart';
import 'package:mandebem/topicos/filosofoseafins.dart';
import 'package:mandebem/topicos/juventude.dart';
import 'package:mandebem/topicos/sabedoria.dart';
import 'package:mandebem/topicos/saude.dart';
import 'package:mandebem/topicos/trabalho.dart';
import 'package:mandebem/topicos/violencia.dart';
import 'package:flutter/material.dart';

class CustomRoutes {
  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => SplashCustom(),
    '/saude': (context) => Saude(),
    '/educacao': (context) => Educacao(),
    '/settings': (context) => Settings(),
    '/compre': (context) => Compre(),
    '/violencia': (context) => Violencia(),
    '/juventude': (context) => Juventude(),
    '/filosofos': (context) => FilosofosEAfins(),
    '/sabedoria': (context) => Sabedoria(),
    '/trabalho': (context) => Trabalho(),
    '/mandeCitacao' : (context) => MandeCitacao(),
    '/aristoteles': (context) => aristoteles(context),
    '/darwin': (context) => darwin(context),
    '/login' : (context) => Login(),
    '/cadastro' :(context) => Cadastro(),
    
  };
}

Widget aristoteles(BuildContext context) {
  return Filosofos(
    appBarTitle: "Aristóteles",
    filosofoImage: "images/aristoteles.jpeg",
    filosofoNome: "Aristóteles",
    contentAlert: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Aristoteles",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Aristóteles (384-322 a.C.) foi um importante filósofo grego. Um dos pensadores com maior influência na cultura ocidental.Foi discípulo do filósofo Platão.\nElaborou um sistema filosófico que abordou sobre praticamente todos os assuntos existentes, como a geometria, física, metafísica, botânica, zoologia, astronomia, medicina, psicologia, ética, drama, poesia, retórica, matemática e principalmente lógica.\nAristóteles nasceu em Estagira, na Macedônia, colônia grega, no ano de 384 a.C. Filho de Nicômaco, médico do rei Amintas III, recebeu sólida formação em Ciências Naturais.",
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    ),
    map: {
      '1': Frases(
          'O sábio nunca diz tudo o que pensa, mas pensa sobre tudo que diz.',
          'Aristóteles'),
      '2': Frases('O homem solitário é uma besta ou um deus.', 'Aristóteles'),
      '3': Frases('O que é um amigo? Uma única alma habitando dois corpos.',
          'Aristóteles'),
      '4': Frases('Sócrates é meu amigo, mas sou mais amigo da verdade.',
          'Aristóteles'),
      '5': Frases(
          'A cultura é o melhor conforto para a velhice.', 'Aristóteles'),
      '6': Frases(
          'O menor desvio inicial da verdade multiplica-se ao infinito à medida que avança.',
          'Aristóteles')
    },
  );
}

Widget darwin(BuildContext context) {
   return Filosofos(
    appBarTitle: "Darwin",
    filosofoImage: "images/Darwin.jpg",
    filosofoNome: "Darwin",
    contentAlert: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Aristoteles",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Aristóteles (384-322 a.C.) foi um importante filósofo grego. Um dos pensadores com maior influência na cultura ocidental.Foi discípulo do filósofo Platão.\nElaborou um sistema filosófico que abordou sobre praticamente todos os assuntos existentes, como a geometria, física, metafísica, botânica, zoologia, astronomia, medicina, psicologia, ética, drama, poesia, retórica, matemática e principalmente lógica.\nAristóteles nasceu em Estagira, na Macedônia, colônia grega, no ano de 384 a.C. Filho de Nicômaco, médico do rei Amintas III, recebeu sólida formação em Ciências Naturais.",
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    ),
    map: {
      '1': Frases(
          'O sábio nunca diz tudo o que pensa, mas pensa sobre tudo que diz.',
          'Aristóteles'),
      '2': Frases('O homem solitário é uma besta ou um deus.', 'Aristóteles'),
      '3': Frases('O que é um amigo? Uma única alma habitando dois corpos.',
          'Aristóteles'),
      '4': Frases('Sócrates é meu amigo, mas sou mais amigo da verdade.',
          'Aristóteles'),
      '5': Frases(
          'A cultura é o melhor conforto para a velhice.', 'Aristóteles'),
      '6': Frases(
          'O menor desvio inicial da verdade multiplica-se ao infinito à medida que avança.',
          'Aristóteles')
    },
  );
}
