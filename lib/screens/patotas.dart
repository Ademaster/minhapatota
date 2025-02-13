import 'package:flutter/material.dart';
import 'package:minhapatota/components/appBarStandard.dart';
import 'package:minhapatota/screens/championship.dart';
import 'package:minhapatota/screens/team.dart';

class Patotas extends StatefulWidget {
  final String categoria; // Adiciona o parâmetro obrigatório

  const Patotas({super.key, required this.categoria}); // Ajusta o construtor

  @override
  State<Patotas> createState() => _PatotasState();
}

class _PatotasState extends State<Patotas> {
  void _optionsSelected(String option) {
    Widget page;

    if (option == "Time") {
      page = Team(); // Definir a página correta
    } else {
      page = Championship(); // Definir a página correta
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page, // Passa a página definida
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStandard(
        title: widget.categoria, // Exibe a categoria no título
      ),
      backgroundColor: const Color.fromARGB(255, 0, 255, 147),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                "Vamos criar um ...",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            GestureDetector(
              onTap: () {
                _optionsSelected("Time");
              },
              child: Image.asset("images/time.png", height: 200),
            ),
            GestureDetector(
              onTap: () {
                _optionsSelected("Campeonato");
              },
              child: Image.asset("images/campeonato.png", height: 300),
            )
          ],
        ),
      ),
    );
  }
}
