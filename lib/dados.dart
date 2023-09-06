

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';




class dados extends StatefulWidget {
  const dados({super.key});

  @override
  State<dados> createState() => _dadosState();
}

class _dadosState extends State<dados> {

  
  List searchResult= [];

  void buscar(String query)async{

    final result = await FirebaseFirestore.instance.collection('estoque').where(
      'Produto',
      isEqualTo: query)
      .get();

      setState(() {
        searchResult = result.docs.map((e) => e.data() ).toList();
      });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true,backgroundColor: Colors.black,foregroundColor: Colors.yellowAccent, title: const Text('Produtos Cadastrados',),
    )
    ,
    
  
    body: 

    
    
    Container(decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.cyan, Color.fromARGB(115, 250, 163, 2)])),
      child: Column(children: [
    
        Padding(padding:const EdgeInsets.all(15.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            hintText: 'Buscar',
          ),
          onChanged: (query){
            buscar(query);
          },
        ),),
        Expanded(child: ListView.builder(
          itemCount: searchResult.length,
          itemBuilder: (context,index){
          return ListTile(
      
              title: Text(
                searchResult[index]['Produto']),
              subtitle:Text(searchResult[index]['Quantidade']+' Unidades'), 
              titleTextStyle: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),
              subtitleTextStyle: TextStyle(fontSize: 30,color: Colors.black),
            
          
          );
        }))
        
      ]),
    ),

     
    
    );
  }
}

    
    
    
   


   
 