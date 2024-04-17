import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sobre o Projeto',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Este aplicativo foi desenvolvido como parte do aprendizado em desenvolvimento de aplicativos para dispositivos móveis. O objetivo do projeto é oferecer uma ferramenta útil para a criação e gerenciamento de listas de compras, facilitando o dia a dia dos usuários.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Funcionalidades:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '• Criação e gerenciamento de listas de compras;\n• Adição, edição e remoção de itens das listas;\n• Pesquisa de itens na lista;\n• Funcionalidade de login e cadastro de usuários.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Desenvolvido por Glauber Noccioli',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            // Espaço reservado para o logotipo da faculdade
            Placeholder(fallbackHeight: 100, fallbackWidth: double.infinity),
            SizedBox(height: 20),
            // Espaço reservado para o logotipo do curso
            Placeholder(fallbackHeight: 100, fallbackWidth: double.infinity),
          ],
        ),
      ),
    );
  }
}
