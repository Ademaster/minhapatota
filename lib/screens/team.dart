import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minhapatota/components/appBarStandard.dart';
import 'dart:io';

import 'package:minhapatota/screens/login.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _namePeopleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _localController = TextEditingController();
  final TextEditingController _taxaController = TextEditingController();

  final _phoneController = TextEditingController();
  File? _logo; // Armazena a logo carregada

  // Método para selecionar a imagem
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _logo = File(pickedFile.path);
      });
    }
  }

  void _cadastrar() {
    // Lógica para cadastro
    debugPrint(
      "Time: ${_emailController.text} + ${_teamNameController.text} + ${_namePeopleController.text} + ${_phoneController.text}+ ${_localController.text}+ ${_taxaController.text}",
    );

    // Exibir o SnackBar antes de navegar para a tela de login
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Salvo com sucesso, faça o Login!",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 192, 24),
      ),
    );

    // Aguarda um pequeno tempo para o usuário ver a mensagem antes de trocar de tela
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStandard(
        title: "Cadastrar Equipe",
        showBackButton: true,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 255, 147),
      body: Container(
        padding: const EdgeInsets.only(top: 0, bottom: 5, right: 25, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Dados principais da Equipe...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 50, 51, 51),
                ),
              ),
            ),

            // Adicionando espaço para a logo da equipe
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:
                      _pickImage, // Ao clicar, abre a galeria para escolher a imagem
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: const Color.fromARGB(255, 180, 180, 180),
                          width: 2),
                      image: _logo != null
                          ? DecorationImage(
                              image: FileImage(_logo!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      color: Colors
                          .white24, // Fundo levemente visível caso não tenha imagem
                    ),
                    child: _logo == null
                        ? const Icon(Icons.add,
                            size: 50, color: Color.fromARGB(255, 172, 172, 172))
                        : null,
                  ),
                ),
                const SizedBox(height: 8), // Espaço entre a imagem e o texto
                const Text(
                  "Escudo",
                  style: TextStyle(
                    color: Color.fromARGB(255, 59, 59, 59),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10), // Espaço extra abaixo da logo
            TextField(
              controller: _teamNameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: "Nome da Equipe:"),
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(width: 10),
            TextField(
              controller: _namePeopleController,
              keyboardType: TextInputType.name,
              decoration:
                  const InputDecoration(labelText: "Pessoa Responsável:"),
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: "Celular"),
              style: const TextStyle(fontSize: 15),
              inputFormatters: [
                MaskedInputFormatter('(##) ##### ####'),
              ],
            ),

            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: "Email"),
              style: const TextStyle(fontSize: 15),
            ),
            TextField(
              controller: _localController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: "Local do Jogo:"),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dateController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(labelText: "Data e Horário:"),
              style: const TextStyle(fontSize: 20),
            ),
            // TextField(
            //   controller: _taxaController,
            //   keyboardType: TextInputType.number,
            //   decoration: const InputDecoration(labelText: "Mensalidade:"),
            //   style: const TextStyle(fontSize: 20),
            // ),

            TextField(
              controller: _taxaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Mensalidade:"),
              style: const TextStyle(fontSize: 20),
              inputFormatters: [CurrencyInputFormatter()],
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _cadastrar,
                  child: const Text(
                    "Salvar",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
