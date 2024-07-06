import 'package:flutter/material.dart';
import 'package:somar/bd/database.dart';
import 'package:somar/models/produtor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(Database().usuarioLogado?.nome ?? ''),
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: Column(
            children: [
            Expanded(
              child: ListView.builder(
                itemCount:  Database().produtos.length,
                itemBuilder: (context, index){
                  var item = Database().produtos.elementAt(index);
          
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Expanded(
                      child: Material(
                        child: InkWell(
                          onTap: (){},
                          child: Ink(
                            color: Color.fromARGB(255, 218, 218, 218),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 15),
                                const Icon(Icons.calendar_month_outlined),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(item.titulo, style: const TextStyle(
                                        fontWeight: FontWeight.w400, fontSize: 16,
                                      ),),
                                      Text('Quandidade: ${item.quantidade.toString()}',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            ), 
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            Database().addProduto(Produto(
              codigo: Database().produtos.length+1,
              data: 'teste',
              titulo: 'Título teste',
              quantidade: 10,
            ));
          },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}