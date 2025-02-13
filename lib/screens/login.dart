import 'package:flutter/material.dart';
import 'package:minhapatota/screens/loading.dart';
import 'package:minhapatota/screens/recoveryPassword.dart';
import 'package:minhapatota/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePswText =
      true; // Variável para controlar a visibilidade da senha

  // void _logar() {
  //   _navigateTo();
  //   debugPrint("Login com: ${_emailController.text}");
  // }

  void _navigateTo() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Loading(),
      ),
    );
  }

  void _navigateToRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Register(),
      ),
    );
  }

  void _navigateToRecoveryPassword() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RecuperarSenha(),
      ),
    );
  }

  void _validateCredentials() {
    if (_emailController.text == "teste@gmail.com" &&
        _passwordController.text == "123") {
      _navigateTo();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Login inválido, verifique suas credenciais!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o modal
                },
                child: const Text(
                  "OK",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildSocialButton(String imagePath, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      child: SizedBox(
        width: 30,
        height: 30,
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 255, 147),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 80, bottom: 40),
              child: Text(
                "Entrar",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                "Oi! Bem vindo de volta, você fez falta.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 50, 51, 51),
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: "Email"),
              style: const TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePswText, // Controla a visibilidade
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: "Senha",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePswText
                        ? Icons.visibility_off
                        : Icons.visibility, // Alterna o ícone
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePswText =
                          !_obscurePswText; // Alterna entre ocultar e mostrar senha
                    });
                  },
                ),
              ),
            ),
            InkWell(
              onTap: _navigateToRecoveryPassword,
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 2, 101, 182),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _validateCredentials,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text(
                "Login Social",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 50, 51, 51),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton("images/logoGoogle.png", () {
                    debugPrint("Botão Google pressionado!");
                  }),
                  const SizedBox(width: 10),
                  _buildSocialButton("images/logoApple.png", () {
                    debugPrint("Botão Apple pressionado!");
                  }),
                  const SizedBox(width: 10),
                  _buildSocialButton("images/logoFacebook.png", () {
                    debugPrint("Botão Facebook pressionado!");
                  }),
                ],
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alinha os itens ao centro
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Text(
                    "Não tem uma conta?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                const SizedBox(width: 5), // Reduzido para aproximar os textos
                InkWell(
                  onTap: _navigateToRegister,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      "Inscreva-se",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 29, 4, 172),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.asset(
                "images/logoMPatota.png",
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
