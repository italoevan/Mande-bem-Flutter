import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MandeCitacao extends StatefulWidget {
  @override
  _MandeCitacaoState createState() => _MandeCitacaoState();
}

class _MandeCitacaoState extends State<MandeCitacao> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController controller = TextEditingController();
  int maxLength = 85;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double witdh = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: [
            Text("Mande Sua Citação"),
            SizedBox(
              width: 8,
            ),
            Icon(Icons.sms)
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'images/background.jpeg',
              fit: BoxFit.cover,
              height: height,
              width: witdh,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  maxLength: 85,
                ),
                Divider(
                  color: Colors.transparent,
                ),
                SizedBox(
                  height: 55,
                  width: 160,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: Colors.purple[900],
                    onPressed: () {
                      if (controller.text != null &&
                          controller.text.length > 10 &&
                          controller.text.length < 85) {
                        salvar();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/home', (route) => false);
                      } else {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                                "O texto não pode estar vazio e tem que ter mais de 10 caracteres.")));
                      }
                    },
                    child: Text("Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 27)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  salvar() async {
    String id = auth.currentUser.uid;
    var autor = await firebaseFirestore.collection('usuarios').doc(id).get();

    firebaseFirestore
        .collection('frases_usuarios')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set({'autor': autor.data()['apelido'], 'frase': controller.text});
  }
}
