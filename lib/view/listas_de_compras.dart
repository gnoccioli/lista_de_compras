import 'package:flutter/material.dart';
import 'compras.dart';

class ListaDeCompras {
  String nome;
  List<ItemDeCompra> itens;

  ListaDeCompras({
    required this.nome,
    List<ItemDeCompra>? itens,
  }) : this.itens = itens ?? [];  // Se itens for null, inicialize com uma lista vazia mutável
}


class ListasDeCompras extends StatefulWidget {
  const ListasDeCompras({Key? key}) : super(key: key); 

  @override
  _ListasDeComprasState createState() => _ListasDeComprasState();
}

class _ListasDeComprasState extends State<ListasDeCompras> {
  final List<ListaDeCompras> _listas = [];
  final TextEditingController _controller = TextEditingController();

  void _adicionarLista() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _listas.add(ListaDeCompras(nome: _controller.text));
        _controller.clear();
      });
    }
  }

  void _renomearLista(ListaDeCompras lista) {
    final _renameController = TextEditingController(text: lista.nome);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Renomear Lista'),
          content: TextField(
            controller: _renameController,
            decoration: const InputDecoration(labelText: 'Novo nome'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_renameController.text.isNotEmpty) {
                  setState(() {
                    lista.nome = _renameController.text;
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Lista "${lista.nome}" renomeada com sucesso!')),
                  );
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Listas de Compras'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Nova Lista',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _adicionarLista,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReorderableListView(
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final item = _listas.removeAt(oldIndex);
                  _listas.insert(newIndex, item);
                });
              },
              children: <Widget>[
                for (final lista in _listas)
                  Dismissible(
                    key: Key(lista.nome),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        _listas.remove(lista);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Lista "${lista.nome}" removida com sucesso!')),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      title: Text(lista.nome),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Compras(listaDeCompras: lista),
                          ),
                        );
                      },
                      onLongPress: () => _renomearLista(lista),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
