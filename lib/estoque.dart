
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graeffeng/dados.dart';


import 'firebase_options.dart';



class estoque extends StatefulWidget {
  const estoque({super.key});

  @override
  State<estoque> createState() => _estoqueState();
}

class _estoqueState extends State<estoque> {

void atualizar(){
  final docUser = FirebaseFirestore.instance.collection('estoque').doc('');

  docUser.update({
    'produto':'ATUALIZANDO',
    'quantidade':'99999'
  }
  );
}

  
  TextEditingController produto = TextEditingController();
  TextEditingController quantidade = TextEditingController();
    TextEditingController id = TextEditingController();

  

 Future<void> add() async {
    
    String quant = quantidade.text;
    String prod = produto.text;
    String number = id.text;

    
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    if (number == '' || quant == '' || prod == '') {
     snack(context);
    } else {
      final data = {"ID": number ,"Produto": prod, "Quantidade": quant};

      FirebaseFirestore.instance.collection("estoque").add(data).then(
          (documentSnapshot) =>
              print("Added Data with ID: ${documentSnapshot.id}"));

      snackSucess(context);
    }

    setState(() {
      produto.clear();
      quantidade.clear();
     
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.cyan, Color.fromARGB(115, 250, 163, 2)])),
        child: ListView(padding: const EdgeInsets.all(16), children: [
          Container(
              width: 250,
              height: 250,
              child: Image.asset('assets/images/estoque.png')),
          TextField(
            controller: id,
            decoration:
                InputDecoration(border: OutlineInputBorder(), labelText: 'ID'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: produto,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Produto'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: quantidade,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Quantidade'),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.yellowAccent),
            onPressed: () {

              add();
              
            },
            child: Text('Adicionar'),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.yellowAccent),
              onPressed: () {

               Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => dados()));
                
              },
              child: Text('Produtos')),

             // TextButton(
             // style: TextButton.styleFrom(
             //     backgroundColor: Colors.black,
             //     foregroundColor: Colors.yellowAccent),
            //  onPressed: () {

              //  final docUser = FirebaseFirestore.instance.collection(
              //    'estoque'
             //   ).doc('rCP5UYmGZkZ14Ab3xaDX');

              //  docUser.update({'Produto':'teste'});
                
              
                
            //  },
             // child: Text('Atualizar')),
        ]),
      ),
    );
  }
  }





  void snack(context) {
    final snackBar = SnackBar(
        backgroundColor: Colors.black,
        content: const Text(
            style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 20,
            ),
            'Não foi possível registar o produto !'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void snackSucess(context) {
    final snackBar = SnackBar(
        backgroundColor: Colors.black,
        content: const Text(
            style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 20,
            ),
            'Produto adicionado com sucesso !'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  

