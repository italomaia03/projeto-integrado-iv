import 'package:flutter/material.dart';

class ProdutoPage extends StatefulWidget {
  const ProdutoPage({super.key});

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Adicionar produtos'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          // função salvar novo produto
          // Database().addProduto(Produto);

          Navigator.pop(context);
        },
        label: Text('Salvar produto'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}