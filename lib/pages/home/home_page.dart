import 'package:flutter/material.dart';
import 'package:somar/db/database.dart';
import 'package:somar/routes.dart';

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
        title: Text(Database().usuarioLogado?.nome ?? '', style: TextStyle(
          color: Colors.white,
        ),
        ),
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
                            color: Color.fromRGBO(187, 229, 240, 1),
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
                                      Text('Quantidade: ${item.quantidade.toString()}',
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
        onPressed: () async {
          await Navigator.of(context).pushNamed(Routes.produtos);

          setState(
            () { },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}