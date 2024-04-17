import 'package:flutter/material.dart';
import 'view/login.dart';
import 'view/cadastro.dart';
import 'view/reset_senha.dart';
import 'view/sobre.dart';
import 'view/listas_de_compras.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Adicionando parâmetro 'key'

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(), // Removendo 'const'
        '/cadastro': (context) => Cadastro(),
        '/reset': (context) => ResetSenha(),
        '/sobre': (context) => Sobre(),
        '/lista': (context) => ListasDeCompras(),
        // A rota para 'compras' foi removida anteriormente
      },
    );
  }
}
