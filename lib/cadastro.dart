
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';



class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String email = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        centerTitle: true,
        title: Text('Tela de Cadastro '),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.cyan, Color.fromARGB(115, 250, 163, 2)])),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Email'),
            onChanged: (text) {
              email = text;
            },
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Senha'),
            onChanged: (text) {
              senha = text;
            },
          ),
          SizedBox(
            height: 40,
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.yellow,
              backgroundColor: Colors.black,
            ),
            onPressed: () async {

              cadastro(email, senha);
              
            },
            child: Text('CADASTRAR'),
          )
        ]),
      ),
    );
  }
}
Future<void> cadastro(email, senha) async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'Senha Fraca') {
      print('The password provided is too weak.');
    } else if (e.code == 'Email já utilizado') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}


