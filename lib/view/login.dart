import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\\.,;:\s@\"]+\.)+[^<>()[\]\\.,;:\s@\"]{2,})$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Insira um e-mail válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                    context,
                    '/lista',// Implemente a navegação para a tela de cadastro
                    );
                    // Implemente a lógica de validação e login
                    // if (_formKey.currentState!.validate()) {
                    // Se o formulário for válido, proceda com o login
                    },
                  child: Text('Entrar'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                  context,
                  '/cadastro',// Implemente a navegação para a tela de cadastro
                  );
                },
                child: Text('Cadastrar novo usuário'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                  context,
                  '/reset',// Implemente a navegação para a tela de cadastro
                  );// Implemente a navegação para a tela de recuperação de senha
                },
                child: Text('Esqueceu a senha?'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                  context,
                  '/sobre',// Implemente a navegação para a tela de cadastro
                  );  // Implemente a navegação para a tela sobre
                },
                child: Text('Sobre'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
