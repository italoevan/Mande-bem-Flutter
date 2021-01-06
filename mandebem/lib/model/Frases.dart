import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Frases {
  String texto;
  String autor;

  Frases(this.texto,this.autor);
  Frases.firebase(DocumentSnapshot snapshot){

  }
}
