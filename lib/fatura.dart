import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:graeffeng/home.dart';


class fatura extends StatefulWidget {
  const fatura({super.key});

  @override
  State<fatura> createState() => _faturaState();
}

class _faturaState extends State<fatura> {
  TextEditingController janeiro = TextEditingController();
  TextEditingController fevereiro = TextEditingController();
  TextEditingController marco = TextEditingController();
  TextEditingController abril = TextEditingController();
  TextEditingController maio = TextEditingController();
  TextEditingController junho = TextEditingController();
  TextEditingController julho = TextEditingController();
  TextEditingController agosto = TextEditingController();
  TextEditingController setembro = TextEditingController();
  TextEditingController outubro = TextEditingController();
  TextEditingController novembro = TextEditingController();
  TextEditingController dezembro = TextEditingController();

  String infotext = '';

  void calcular() {
    double jan = double.parse(janeiro.text);
    double fev = double.parse(fevereiro.text);
    double abr = double.parse(abril.text);
    double mar = double.parse(marco.text);
    double mai = double.parse(maio.text);
    double jun = double.parse(junho.text);
    double jul = double.parse(julho.text);
    double ago = double.parse(agosto.text);
    double set = double.parse(setembro.text);
    double out = double.parse(outubro.text);
    double nov = double.parse(novembro.text);
    double dez = double.parse(dezembro.text);

    double consumoMedio =
        jan + fev + mar + abr + mai + jun + jul + ago + set + out + nov + dez;

    double resultado = consumoMedio / 12;

    setState(() {
      infotext =
          'Consumo Médio é: ' + resultado.toStringAsPrecision(4) + ' kWh/mês';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        title: Text(infotext),
      ),
      body: Container(
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
              keyboardType: TextInputType.number,
              controller: janeiro,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Janeiro'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: fevereiro,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Fevereiro'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: marco,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Março'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: abril,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Abril'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: maio,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Maio'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: junho,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Junho'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: julho,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Julho'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: agosto,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Agosto'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: setembro,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Setembro'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: outubro,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Outubro'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: novembro,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Novembro'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: dezembro,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Dezembro'),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.yellowAccent),
              onPressed: () {
                calcular();
              },
              child: Text('Calcular'),
            ),
            BackButton(onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            }),
          ],
        )),
      ),
    );
  }
}
