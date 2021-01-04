import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String senha;
  String erroEmail;
  String erroSenha;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: height / 3,
                    child: Center(
                      child: Text(
                        "Entre",
                        style: TextStyle(color: Colors.white, fontSize: 45),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        TextField(
                          //email
                          onChanged: (String text) {
                            setState(() {
                              email = text;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              errorText: erroEmail,
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: "Email"),
                        ),
                        SizedBox(
                          height: height / 18,
                        ),
                        TextField(
                            obscureText: true,
                            //senha
                            onChanged: (String text) {
                              setState(() {
                                senha = text;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                errorText: erroSenha,
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: "Senha")),
                        SizedBox(
                          height: height / 13,
                        ),
                        SizedBox(
                          height: 55,
                          width: 160,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: Colors.purple[900],
                            onPressed: () {
                              if (email != null) {
                                if (senha != null) {
                                  entrar(email, senha);
                                } else {
                                  setState(() {
                                    erroSenha = "Senha Vazio.";
                                    erroEmail = null;
                                  });
                                }
                              } else {
                                setState(() {
                                  erroEmail = "Email Vazio.";
                                });
                              }
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 27)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 40, left: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/cadastro');
                              },
                              child: Text(
                                "Não tem conta? Cadastre-se!",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
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

  entrar(String email, senha) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) =>
            {Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)})
        .catchError((error) {
      print(error);
    });
  }
}
