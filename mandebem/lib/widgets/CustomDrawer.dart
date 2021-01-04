import 'package:flutter/material.dart';
import 'package:mandebem/screens/Home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool logado;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usuarioLogado();
  }

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
              onTap: () {
                Navigator.pop(context);
                launchUrl();
              },
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
              onTap: () => onTapTile(),
              title: Text("Mande sua citação!", style: TextStyle(fontSize: 22)),
              leading: Icon(
                Icons.lightbulb,
                color: Colors.orangeAccent,
              ),
            ),
            FutureBuilder(
                future: usuarioLogado(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return logado == true
                        ? ListTile(
                            onTap: () {
                              firebaseAuth.signOut();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/', (route) => false);
                            },
                            title: Text(
                              "Sair",
                              style: TextStyle(fontSize: 22),
                            ),
                            leading: Icon(Icons.login_outlined),
                          )
                        : ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            title: Text(
                              "Faça Login",
                              style: TextStyle(fontSize: 22),
                            ),
                            leading: Icon(
                              Icons.login,
                              color: Colors.black,
                            ),
                          );
                  }
                })
          ],
        ),
      )),
    );
  }

  launchUrl() async {
    await launch(
        'https://play.google.com/store/apps/details?id=com.evinc.mandebem');
  }

  Future<bool> usuarioLogado() async {
    if (await firebaseAuth.currentUser == null) {
      print("Usuario não Logado");
      logado = false;
      return false;
    } else {
      print("Usuario Logado");
      logado = true;
      return true;
    }
  }

  onTapTile() {
    if (logado) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/mandeCitacao');
    } else {
      Navigator.pop(context);
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Você precisa estar logado.")));
    }
  }
}
