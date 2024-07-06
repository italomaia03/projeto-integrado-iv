import 'package:somar/models/produtor.dart';
import 'package:somar/models/usuario.dart';

class Database{
  static final Database _singleton = Database._internal();

  Database._internal();

  factory Database(){
    return _singleton;
  }
  // Outra gambiarra
  List<Usuario> usuarios = [
    Usuario(
      codigo: 40028922,
      nome: 'Fabrício Freitas',
      email: 'fabricio@gmail.com',
      senha: 'naruto',
    ),
  ];

  List<Produto> produtos = [
    Produto(
      codigo: 1, 
      data: 'data', 
      titulo: 'Vinho padre Cícero 880mL Tinto', 
      quantidade: 100,
      ),
      Produto(
      codigo: 2, 
      data: 'data', 
      titulo: 'Oléo para pernas padre Cícero', 
      quantidade: 100,
      ),
      Produto(
      codigo: 3, 
      data: 'data', 
      titulo: 'Pomada padre Cícero', 
      quantidade: 200,
      )
  ];

  void addProduto(Produto produto){
    produtos.add(produto);
  }

  void removeProduto(int index){
    produtos.removeAt(index);
  }

  Usuario? login(String email, String senha){
    for(var usuario in usuarios){
      if (usuario.email == email && usuario.senha == senha){
        return usuario;
      }
    }
    return null;
  }

  Usuario? usuarioLogado;
}
