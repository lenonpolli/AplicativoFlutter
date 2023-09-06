import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graeffeng/cliente.dart';
import 'package:graeffeng/clientesRegistrados.dart';
import 'package:graeffeng/dados.dart';
import 'package:graeffeng/estoque.dart';
import 'package:graeffeng/home.dart';
import 'package:graeffeng/login.dart';
import 'package:graeffeng/orcamento.dart';


import 'firebase_options.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: HomePage(),

        
       
        
      
      );
  }
}