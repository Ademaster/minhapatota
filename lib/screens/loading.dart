import 'package:flutter/material.dart';
import 'package:minhapatota/screens/categories.dart';
import 'dart:async';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startProgress(); // Inicia o progresso automaticamente ao carregar a tela
  }

  void startProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        if (progress < 1.0) {
          progress += 0.1; // Aumenta 10% a cada meio segundo
        } else {
          _timer?.cancel(); // Para quando atingir 100%
          _navigateTo(); // Chama a função para navegar para a tela de login
        }
      });
    });
  }

  void _navigateTo() {
    // A navegação para a tela de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Categories()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela o timer ao fechar a tela
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 255, 147),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logoMPatota.png",
              height: 160,
              fit: BoxFit.contain,
            ),
            const SizedBox(
                height:
                    30), // Espaçamento entre a imagem e a barra de progresso
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: const Color.fromARGB(255, 155, 155, 155),
                color: const Color(0xFF000447),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color.fromARGB(255, 0, 255, 147),
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "by Ademaster © 2025 V1.0.0",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
