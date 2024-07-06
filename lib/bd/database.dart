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
      nome: 'fabricio',
      email: 'fabricio@gmail.com',
      senha: 'naruto',
    ),
  ];

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
