

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';




class telaOrcamento extends StatefulWidget {
  const telaOrcamento({super.key});

  @override
  State<telaOrcamento> createState() => _telaOrcamentoState();
}

class _telaOrcamentoState extends State<telaOrcamento> {
  TextEditingController Consumo = TextEditingController();
  String infotexto = '';

  void calcular() {
    double con = double.parse(Consumo.text);
    double consumoDia = con / 30.4;
    double resultadoConsumo = consumoDia / 0.76 / (4.78);

    setState(() {
      infotexto = 'Potência do sistema é: ' +
          resultadoConsumo.toStringAsPrecision(4) +
          ' kWp';
    });
  }

  void abrirUrl() async {
    const url = 'https://plataforma.helte.com.br';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
    BackButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => telaOrcamento()));
      },
    );
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
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/sol.png'),
            ),
            TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                controller: Consumo,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Consumo do cliente em (kWh/mês)',
                    labelStyle: TextStyle(
                      color: Colors.yellowAccent,
                    ))),
            SizedBox(
              height: 50,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.yellowAccent),
              onPressed: () {
                calcular();
              },
              child: Text('Calcular Média'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(style: TextStyle(fontSize: 20), infotexto),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.yellowAccent),
              onPressed: () {

                abrirUrl();
                
              },
              child: Text('Fazer orçamento !'),
            ),
          ],
        ),
      ),
    );
  }
}
