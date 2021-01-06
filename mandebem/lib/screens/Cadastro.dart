import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandebem/model/Usuario.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Usuario usuario = Usuario();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.login_outlined),
        backgroundColor: Color(0xff24243e),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                  Color(0xff0f0c29),
                  Color(0xff302b63),
                  Color(0xff24243e)
                ])),
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: height / 5,
                    color: Colors.transparent,
                    child: Center(
                      child: Text("Cadastre-se",
                          style: TextStyle(color: Colors.white, fontSize: 45),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (String text) {
                            usuario.apelido = text;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: "Apelido"),
                        ),
                        SizedBox(
                          height: height / 25,
                        ),
                        TextField(
                          onChanged: (String text) {
                            usuario.email = text;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: "Email"),
                        ),
                        SizedBox(
                          height: height / 25,
                        ),
                        TextField(
                          onChanged: (String text) {
                            usuario.senha = text;
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: "Senha"),
                        ),
                        SizedBox(
                          height: height / 18,
                        ),
                        SizedBox(
                          height: 55,
                          width: 160,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: Colors.purple[900],
                            onPressed: () {
                              cadastrar(usuario);
                            },
                            child: Text("Cadastrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 27)),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void cadastrar(Usuario user) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: user.email, password: user.senha)
        .then((value) {
      salvarApelido(user);
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }).catchError((error) {
      print("Error");
    });
  }

  Future salvarApelido(Usuario user) async {
    String idUser = await firebaseAuth.currentUser.uid;

    firestore.collection('usuarios').doc(idUser).set({'apelido': user.apelido});
  }
}
