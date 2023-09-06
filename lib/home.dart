import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graeffeng/cliente.dart';
import 'package:graeffeng/clientesRegistrados.dart';
import 'package:graeffeng/dados.dart';
import 'package:graeffeng/estoque.dart';
import 'package:graeffeng/fatura.dart';
import 'package:graeffeng/orcamento.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Graeff Engenharia'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.cyanAccent, Color.fromARGB(115, 250, 163, 2)])),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Material(color: Colors.black,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                
                  child: InkWell(
                      
                      onTap: () {
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => fatura()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                           image: const AssetImage('assets/images/calculadorabtn.png'),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),SizedBox(width: 50,),
                            Container(
                              color: Colors.black,
                          
                              
                                child: Text('Calcular Média',
                                  style: TextStyle(fontSize: 22,color: Colors.yellowAccent,fontStyle: FontStyle.italic),),
                              
                            ),

                        ],
                      ),
                      
                    ),
              ),SizedBox(height: 20,),
              Material(color: Colors.black,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                
                  child: InkWell(
                      
                      onTap: () {
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => telaOrcamento()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                           image: const AssetImage('assets/images/orcamentobtn.png'),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),SizedBox(width: 50,),
                            Container(
                              color: Colors.black,
                          
                              child: Text('Orçamento',
                                style: TextStyle(fontSize: 22,color: Colors.yellowAccent,fontStyle: FontStyle.italic),),
                            ),

                        ],
                      ),
                      
                    ),
                ),SizedBox(height: 20,),
                Material(color: Colors.black,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                
                  child: InkWell(
                      
                      onTap: () {
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => estoque()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                           image: const AssetImage('assets/images/estoquebtn.png'),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),SizedBox(width: 50,),
                            Container(
                              color: Colors.black,
                          
                              child: Text('Estoque',
                                style: TextStyle(fontSize: 22,color: Colors.yellowAccent,fontStyle: FontStyle.italic),),
                            ),

                        ],
                      ),
                      
                    ),
                ),SizedBox(height: 20,),
              
  
               Material(color: Colors.black,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                
                  child: InkWell(
                      
                      onTap: () {
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => dados()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                           image: const AssetImage('assets/images/cadastrobtn.png'),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),SizedBox(width: 50,),
                            Container(
                              color: Colors.black,
                          
                              child: Text('Produtos Cadastrados',
                                style: TextStyle(fontSize: 22,color: Colors.yellowAccent,fontStyle: FontStyle.italic),),
                            ),

                        ],
                      ),
                      
                    ),
                ),SizedBox(height: 20,),

            Material(color: Colors.black,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                
                  child: InkWell(
                      
                      onTap: () {
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => clientes()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                           image: const AssetImage('assets/images/clientebtn.png'),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),SizedBox(width: 50,),
                            Container(
                              color: Colors.black,
                          
                              child: Text('Cadastrar Cliente',
                                style: TextStyle(fontSize: 22,color: Colors.yellowAccent,fontStyle: FontStyle.italic),),
                            ),

                        ],
                      ),
                      
                    ),
                ),SizedBox(height: 20,),
                Material(color: Colors.black,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                
                  child: InkWell(
                      
                      onTap: () {
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => clientesRegistrados()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                           image: const AssetImage('assets/images/client.png'),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),SizedBox(width: 50,),
                            Container(
                              color: Colors.black,
                          
                              child: Text('Clientes Cadastrados',
                                style: TextStyle(fontSize: 22,color: Colors.yellowAccent,fontStyle: FontStyle.italic),),
                            ),

                        ],
                      ),
                  )
                      
                    ),
            ],
          )),
    );
  }
}
