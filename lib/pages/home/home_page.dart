import 'package:flutter/material.dart';
import 'package:somar/bd/database.dart';

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
        child: Column(
          children: [
          Expanded(
            child: ListView.builder(
              itemCount:  Database().produtos.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 50,
                    color: Color.fromARGB(255, 218, 218, 218),
                  ),
                );
              }),
          ), 
          ],
        ),
      ),
    );
  }
}