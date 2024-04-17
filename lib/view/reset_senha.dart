import 'package:flutter/material.dart';

class ResetSenha extends StatefulWidget {
  @override
  _ResetSenhaState createState() => _ResetSenhaState();
}

class _ResetSenhaState extends State<ResetSenha> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  void _resetPassword() {
    // Aqui você implementaria a lógica de envio do e-mail de recuperação
    // Por exemplo, usando um serviço de autenticação como o Firebase Auth
    // Por ora, vamos apenas imprimir o e-mail no console para simular
    print('Enviando link de recuperação para $_email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
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
                  _email = value;
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Se o formulário for válido, proceda com a redefinição de senha
                    _resetPassword();
                  }
                },
                child: Text('Enviar Link de Recuperação'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
