import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graeffeng/cadastro.dart';
import 'package:graeffeng/home.dart';

import 'firebase_options.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String login = "";
  String senha = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.cyan, Color.fromARGB(115, 250, 163, 2)])),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 200,
          height: 200,
          child: Image.asset('assets/images/logo.png'),
        ),
        TextField(
          onChanged: (text) {
            login = text;
          },
          keyboardType: TextInputType.emailAddress,
          decoration:
              InputDecoration(border: OutlineInputBorder(), labelText: 'Email'),
        ),
        SizedBox(height: 10),
        TextField(
            onChanged: (text) {
              senha = text;
            },
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.redAccent),
              ),
              labelText: 'Senha',
            )),
        SizedBox(height: 10),

         
         
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.yellow,
              backgroundColor: Colors.black,
              textStyle: TextStyle(fontSize: 20)),
          onPressed: () async {

            User? user = await loginUsingEmailPassword(
                login: login, senha: senha, context: context);
            print(user);
            if (user != null) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            }
           
            
          },
          child: Text('Entrar'),
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Cadastro()));
          },
          child: Text('Não possui uma conta ? Cadastre-se agora !'),
        )
      ]),
    ));
  }
}
Future<User?> loginUsingEmailPassword(
    {required String login,
    required String senha,
    required BuildContext context}) async {
  
  User? user;
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: login, password: senha);
    user = userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      print('No user found for that email');
    }
  }
  return user;
}
