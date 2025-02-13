import 'package:flutter/material.dart';
import 'package:minhapatota/components/appBarStandard.dart';
import 'package:minhapatota/screens/patotas.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> ufs = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];

  List<String> citys = [
    'BLUMENAU',
    'GASPAR',
    'INDAIAL',
    'POMERODE',
    'BRUSQUE',
    'ITAJAI'
  ];

  String? selectedUf; // Variável para armazenar o UF selecionado
  String? selectedCity; // Variável para armazenar a cidade selecionado

  void _categorieSelected(String categoria) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Patotas(categoria: categoria), // Passando a categoria
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStandard(
        title: (""),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 255, 147),
      body: Container(
        padding: const EdgeInsets.only(top: 0, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 15),
              child: Text(
                "Categorias",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Selecione o estado e a cidade desejada",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 50, 51, 51),
                ),
              ),
            ),
            DropdownButtonFormField<String>(
              padding: const EdgeInsets.all(10),
              value: selectedUf, // Define o valor selecionado
              decoration: const InputDecoration(
                labelText: 'Selecione o Estado',
                labelStyle: TextStyle(
                  fontSize: 18, // Altere o tamanho da fonte conforme necessário
                  fontWeight:
                      FontWeight.bold, // Adiciona um estilo de peso se desejar
                ),
                border: OutlineInputBorder(),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedUf = newValue; // Atualiza o valor da UF selecionada
                });
              },
              items: ufs.map<DropdownMenuItem<String>>((String uf) {
                return DropdownMenuItem<String>(
                  value: uf,
                  child: Text(uf),
                );
              }).toList(),
            ),
            DropdownButtonFormField<String>(
              padding: const EdgeInsets.all(10),
              value: selectedCity, // Define o valor selecionado
              decoration: const InputDecoration(
                labelText: 'Selecione a Cidade',
                labelStyle: TextStyle(
                  fontSize: 18, // Altere o tamanho da fonte conforme necessário
                  fontWeight:
                      FontWeight.bold, // Adiciona um estilo de peso se desejar
                ),
                border: OutlineInputBorder(),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity =
                      newValue; // Atualiza o valor da Cidade selecionada
                });
              },
              items: citys.map<DropdownMenuItem<String>>((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20, top: 30),
              child: Text(
                "Selecione a Categoria",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 50, 51, 51),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    _categorieSelected("Vôlei");
                  },
                  child: Image.asset("images/volei.png", height: 160),
                ),
                GestureDetector(
                  onTap: () {
                    _categorieSelected("Futebol");
                  },
                  child: Image.asset("images/futebol.png", height: 160),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    _categorieSelected("Corrida");
                  },
                  child: Image.asset("images/corrida.png", height: 160),
                ),
                GestureDetector(
                  onTap: () {
                    _categorieSelected("Basquete");
                  },
                  child: Image.asset("images/basquete.png", height: 160),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
