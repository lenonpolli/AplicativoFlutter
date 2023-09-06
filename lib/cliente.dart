import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graeffeng/estoque.dart';

import 'firebase_options.dart';

class clientes extends StatefulWidget {
  const clientes({super.key});

  @override
  State<clientes> createState() => _clientesState();
}

class _clientesState extends State<clientes> {


  TextEditingController nome = TextEditingController();
  TextEditingController telefone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController endereco = TextEditingController();
    TextEditingController potenciaPainel = TextEditingController();
    TextEditingController quantidadePainel = TextEditingController();
    TextEditingController inversor = TextEditingController();


  Future<void> add() async {
    
    String nomeCliente = nome.text;
    String telefoneCliente = telefone.text;
    String emailCliente = email.text;
    String enderecoCliente= endereco.text;
    String potenciaPainelCliente = potenciaPainel.text;
    String quantidadePainelCliente = quantidadePainel.text;
    String inversorCliente = inversor.text;

    
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    if (nomeCliente == '' || telefoneCliente == '' || enderecoCliente == '') {
     snack(context);
    } else {
      final data = {"nome": nomeCliente ,"telefone": telefoneCliente, "email": emailCliente,"endereco:":enderecoCliente,"potencia":potenciaPainelCliente,"quantidade":quantidadePainelCliente,"inversor":inversorCliente};

      FirebaseFirestore.instance.collection("clientes").add(data).then(
          (documentSnapshot) =>
              print("Added Data with ID: ${documentSnapshot.id}"));

      snackSucess(context);
    }

    setState(() {
      nome.clear();
      telefone.clear();
      email.clear();
      endereco.clear();
      potenciaPainel.clear();
      quantidadePainel.clear();
      inversor.clear();
      
     
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        centerTitle: true,
        title: Text('Novo Cliente '),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.cyan, Color.fromARGB(115, 250, 163, 2)])),
          child: Center(
            child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              controller: nome,
             
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nome'),
            ),SizedBox(height: 10,),

            TextField(keyboardType: TextInputType.number,
            controller: telefone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Telefone'),),SizedBox(height: 10,),

                 

            TextField(keyboardType: TextInputType.emailAddress,
            controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),),SizedBox(height: 10,),

            TextField(
              controller: endereco,
              
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Endereço')),

                  SizedBox(height: 10,),

            TextField(
              controller: potenciaPainel,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Potência do Painél'),),
                  SizedBox(height: 10,),

            TextField(keyboardType: TextInputType.number,
            controller: quantidadePainel,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Quantidade de Painéis'),),
                  SizedBox(height: 10,),

            TextField(
              controller: inversor,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Marca/Modelo - Inversor'),),SizedBox(height: 20,),

                   Material(color: Colors.black,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                
                
                  child: InkWell(
                      
                      onTap: () {

                        add();
                         
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                           image: const AssetImage('assets/images/clientebtn.png'),
                          
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),SizedBox(width: 80,),
                            Container(
                              color: Colors.black,
                          
                              child: Text('Cadastrar',
                                style: TextStyle(fontSize: 22,color: Colors.yellowAccent,),),
                            ),

                        ],
                      ),
                      
                    ),
                ),

          
      
      
      
      
      
      
        
          
          
          

          ]
          ),
      )
        )
      )
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
            'Não foi possível registrar o cliente!'));

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
            'Cliente registrado com sucesso !'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  