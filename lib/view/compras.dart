import 'package:flutter/material.dart';
import 'listas_de_compras.dart';  // Certifique-se de que o caminho esteja correto

class ItemDeCompra {
  String nome;
  int quantidade;
  bool comprado;

  ItemDeCompra({
    required this.nome,
    this.quantidade = 1,  // Ajustado a quantidade padrão inicial para 1
    this.comprado = false,
  });
}

class Compras extends StatefulWidget {
  final ListaDeCompras listaDeCompras;

  const Compras({Key? key, required this.listaDeCompras}) : super(key: key);

  @override
  _ComprasState createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  final TextEditingController _itemController = TextEditingController();

  void _adicionarItem() {
    final texto = _itemController.text;
    if (texto.isNotEmpty) {
      setState(() {
        widget.listaDeCompras.itens.add(ItemDeCompra(nome: texto));  // Adicionando item à lista de compras específica
        _itemController.clear();  // Limpa o campo de texto após adicionar o item
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listaDeCompras.nome),  // Mostra o nome da lista de compras no AppBar
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _itemController,
              decoration: InputDecoration(
                labelText: 'Adicionar Item',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _adicionarItem,  // Chama _adicionarItem quando o ícone é pressionado
                ),
              ),
              onSubmitted: (_) => _adicionarItem(),  // Também adiciona o item quando o usuário pressiona Enter
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.listaDeCompras.itens.length,
              itemBuilder: (context, index) {
                final item = widget.listaDeCompras.itens[index];
                return Dismissible(
                  key: UniqueKey(),  // Usando UniqueKey para garantir uma chave única para cada item
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      widget.listaDeCompras.itens.removeAt(index);
                    });
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                  child: ListTile(
                    title: Text(item.nome),
                    leading: Checkbox(
                      value: item.comprado,
                      onChanged: (bool? newValue) {
                        setState(() {
                          item.comprado = newValue!;
                        });
                      },
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => setState(() {
                            item.quantidade = item.quantidade - 1 < 0 ? 0 : item.quantidade - 1;
                          }),
                        ),
                        Text('${item.quantidade}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => setState(() {
                            item.quantidade += 1;
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
