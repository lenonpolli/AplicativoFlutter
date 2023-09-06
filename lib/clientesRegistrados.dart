import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graeffeng/home.dart';

class clientesRegistrados extends StatefulWidget {
  const clientesRegistrados({super.key});

  @override
  State<clientesRegistrados> createState() => _clientesRegistradosState();
}

class _clientesRegistradosState extends State<clientesRegistrados> {
  List searchResult= [];

  void buscar(String query)async{

    final result = await FirebaseFirestore.instance.collection('clientes').where(
      'nome',
      isEqualTo: query)
      .get();

      setState(() {
        searchResult = result.docs.map((e) => e.data() ).toList();
      });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true,backgroundColor: Colors.black,foregroundColor: Colors.yellowAccent, title: const Text('Clientes Cadastrados',),
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
            
          return Column(
            children: [
              ListTile(
      
                  title: Text('Nome:' +
                    searchResult[index]['nome']),


                  subtitle:Text('Email:' + searchResult[index]['email']),
                  
                  titleTextStyle: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),
                  subtitleTextStyle: TextStyle(fontSize: 30,color: Colors.black),

              
              ),
              ListTile(title: Text('Telefone:' + 
                searchResult[index]['telefone']),
              subtitle:Text('Potência:' + searchResult[index]['potencia']),
              
              titleTextStyle: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),
              subtitleTextStyle: TextStyle(fontSize: 30,color: Colors.black),
)  ,             ListTile(title: Text('Inversor:'+
                searchResult[index]['inversor']),
              subtitle:Text('Painéis:' + searchResult[index]['quantidade']),
              
              titleTextStyle: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),
              subtitleTextStyle: TextStyle(fontSize: 30,color: Colors.black),
),ListTile(title: Text('Endereço:' + 
                searchResult[index]['endereco']),
              
              
              titleTextStyle: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),
              subtitleTextStyle: TextStyle(fontSize: 30,color: Colors.black),
),
            ],
          );
        
        }))
        
      ]),
    ),

     
    
    );
  }
}