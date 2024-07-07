import 'package:flutter/material.dart';
import 'package:somar/models/produtor.dart';
import 'package:somar/db/database.dart';
import 'package:somar/widgets/custom_edit.dart';

class ProdutoPage extends StatefulWidget {
  const ProdutoPage({super.key});

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          'Adicionar produtos',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 16, 159, 202),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomEdit(
                controller: _codigoController,
                hintText: 'Código',
                icon: Icons.code,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código do produto';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, insira um número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomEdit(
                controller: _dataController,
                hintText: 'Data',
                icon: Icons.date_range,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a data';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomEdit(
                controller: _tituloController,
                hintText: 'Título',
                icon: Icons.title,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o título do produto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomEdit(
                controller: _quantidadeController,
                hintText: 'Quantidade',
                icon: Icons.production_quantity_limits,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade do produto';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, insira um número válido';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            final novoProduto = Produto(
              codigo: int.parse(_codigoController.text),
              data: _dataController.text,
              titulo: _tituloController.text,
              quantidade: int.parse(_quantidadeController.text),
            );
            addProduto(novoProduto);

            Navigator.pop(context);
          }
        },
        label: const Text('Salvar produto'),
        icon: const Icon(Icons.save),
      ),
    );
  }

  void addProduto(Produto novoProduto) {
    Database().addProduto(novoProduto);
  }
}
