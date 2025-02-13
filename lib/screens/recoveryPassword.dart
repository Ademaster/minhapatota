import 'package:flutter/material.dart';
import 'package:minhapatota/components/appBarStandard.dart';
import 'package:minhapatota/screens/login.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({super.key});

  @override
  State<RecuperarSenha> createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  String _msg = "Enviar Código";
  TextEditingController _controllerEmail = TextEditingController();

  void _gerarCodigo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Código enviado!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _mostrarInputModal(context);
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: const Color.fromARGB(52, 175, 175, 175),
              ),
              child: Text(
                "OK",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        );
      },
    );
  }

  void _mostrarInputModal(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Digite o código",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          content: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            maxLength: 6,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: "Código",
              counterText: "",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_controller.text.length == 6) {
                  int codigo = int.parse(_controller.text);
                  // Aqui você pode adicionar a lógica de verificação do código
                  if (codigo == 123456) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Sucesso, faça o Login!",
                          style: TextStyle(fontSize: 20),
                        ),
                        backgroundColor: const Color.fromARGB(255, 2, 192, 24),
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Código inválido!",
                          style: TextStyle(fontSize: 20),
                        ),
                        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                      ),
                    );
                  }
                } else {
                  // Exibe uma mensagem de erro se não tiver 6 números
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "O código deve ter 6 números!",
                        style: TextStyle(fontSize: 20),
                      ),
                      backgroundColor: const Color.fromARGB(255, 248, 21, 4),
                    ),
                  );
                }
              },
              child: Text(
                "Verificar",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStandard(
        title: (""),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 255, 147),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Redefinir senha do usuário",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "Insira um e-mail associado à sua conta.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 50, 51, 51),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration:
                    const InputDecoration(labelText: "Informe seu E-mail"),
                style: const TextStyle(fontSize: 15),
                controller: _controllerEmail,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _gerarCodigo(context);
                  },
                  child: Text(
                    _msg,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),

            Spacer(), // Empurra tudo para cima e mantém a imagem sempre no rodapé
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Image.asset(
                "images/logoMPatota.png",
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
