import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:minhapatota/components/appBarStandard.dart';
import 'package:minhapatota/screens/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repetPasswordController =
      TextEditingController();
  final _phoneController = TextEditingController();
  bool _obscurePswText =
      true; // Variável para controlar a visibilidade da senha
  bool _obscureRePswText =
      true; // Variável para controlar a visibilidade da senha

  void _cadastrar() {
    // Lógica para cadastro
    debugPrint(
      "Cadastrado com: ${_emailController.text} + ${_firstNameController.text} + ${_lastNameController.text} + ${_phoneController.text}",
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

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
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
        padding: const EdgeInsets.only(top: 0, bottom: 5, right: 25, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                "Cadastre-se",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Criar sua nova conta!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 50, 51, 51),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(labelText: "Nome"),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(labelText: "Sobrenome"),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
              controller: _passwordController,
              obscureText: _obscurePswText, // Controla a visibilidade
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
              style: const TextStyle(fontSize: 15),
            ),
            TextField(
              controller: _repetPasswordController,
              obscureText: _obscureRePswText,
              decoration: InputDecoration(
                labelText: "Repetir Senha",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureRePswText
                        ? Icons.visibility_off
                        : Icons.visibility, // Alterna o ícone
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureRePswText = !_obscureRePswText;
                    });
                  },
                ),
              ),
              style: const TextStyle(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _cadastrar,
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text(
                "Ou cadastre-se com",
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
                    "Já tenho uma conta!",
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
                  onTap: _navigateToLogin,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      "Entrar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 29, 4, 172),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset(
                "images/logoMPatota.png",
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
