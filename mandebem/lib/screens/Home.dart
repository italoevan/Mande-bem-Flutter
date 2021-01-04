import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:mandebem/screens/MandeCitacao.dart';
import 'package:mandebem/tabs/Dicas.dart';
import 'package:mandebem/tabs/Index.dart';
import 'package:mandebem/widgets/CustomAppBar.dart';
import 'package:mandebem/widgets/CustomBottom.dart';
import 'package:mandebem/widgets/CustomDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _controller = PageController();

  int i = 0;
  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myInterstitial.dispose();
    print("Dispose");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("InitState");
    /*
    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      ); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text("Mande Bem Redação")  ,
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                })
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [Index(), Dicas(), MandeCitacao()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/compre');
          },
          child: Icon(Icons.shop_rounded),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomAppBar(context, _controller, i));
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
