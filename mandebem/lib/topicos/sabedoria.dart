import 'dart:async';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandebem/model/Frases.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sabedoria extends StatefulWidget {
  @override
  _EducacaoState createState() => _EducacaoState();
}

class _EducacaoState extends State<Sabedoria> {
  List<Frases> list = List();
  bool verAlert = false;
  bool aparecerAlert;
  SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );

    preferences().then((value) {
      aparecerAlert = value;
      print(value);
    });
    list = [
      Frases(
          "Não basta adquirir sabedoria, é preciso além disso saber utiliza-la.",
          "- CÍCERO"),
      Frases("Sábio é aquele que conhece os limites da própria ignorância.",
          "- SÓCRATES"),
      Frases(
          "O saber a gente aprende com os mestres e os livros.A sabedoria se aprende é com a vida e com os humildes.",
          "- CORA CORALINA"),
      Frases("Um homem não pode fazer o certo numa área da vida, enquanto está ocupado em fazer o errado em outra. A vida é um todo indivisível.", "- Mahatma Gandhi".toUpperCase()),
      Frases("O ignorante afirma, o sábio duvida, o sensato reflete.", "- ARISTOTELES"),
      Frases("A simplicidade é o último grau de sofisticação.", "- Leonard Thiessen"),
      Frases("Não espere por uma crise para descobrir o que é importante em sua vida.", "- PLATÃO"),
      Frases("A vida é para quem topa qualquer parada. Não para quem para em qualquer topada.", "- BOB MARLEY")
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myInterstitial.dispose();
    print("Dispose");
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () => showAlert(context));

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("Sabedoria"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
             Container(
          child: Image.asset("images/background.jpeg",width: width,height: height,fit: BoxFit.cover,),
        ),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                height: height / 1.4,
                width: width / 1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff45a247), Color(0xff283c86)])),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onDoubleTap: () {
                          Clipboard.setData(ClipboardData(
                              text: "\"" +
                                  list[index].texto +
                                  "\"" +
                                  " \n" +
                                  list[index].autor));
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Row(
                            children: [
                              Text("Copiado para área de transferência"),
                              SizedBox(
                                width: width / 8,
                              ),
                              Icon(Icons.done)
                            ],
                          )));
                        },
                        child: Container(
                          height: height / 6.9,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.white),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  child: Text(
                                    list[index].texto,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(list[index].autor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: list.length),
              ),
            )
          ],
        ));
  }

  void showAlert(BuildContext context) {
    aparecerAlert
        ? showDialog(
            builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  content: Text(
                      "De dois cliques para salvar a citação na área de transferência."),
                  actions: [
                    Row(
                      children: [
                        Text("Não mostrar mais"),
                        Checkbox(
                            value: verAlert,
                            onChanged: (bool value) {
                              setState(() {
                                verAlert = value;
                                prefs.setBool('exibirDialog', false);
                                print(prefs.getBool('exibirDialog').toString());
                                Navigator.pop(context);
                              });
                            })
                      ],
                    )
                  ],
                );
              });
            },
            context: context)
        : null;
  }

  Future<bool> preferences() async {
    prefs = await SharedPreferences.getInstance();

    final ativo = prefs.getBool('exibirDialog') ?? true;
    return ativo;
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['estudo', 'enem', 'redacao,portugues'],
  contentUrl: 'https://flutter.io',

  childDirected: false,
  // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

InterstitialAd myInterstitial = InterstitialAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: 'ca-app-pub-6321157595470088/8390336816',
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
);
