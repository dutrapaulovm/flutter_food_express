import 'package:flutter_food_express/data/database_provider.dart';
import 'package:flutter_food_express/domain/models/estado.dart';
import 'package:flutter_food_express/domain/repositories/estado_repository.dart';

void main() async{

  DatabaseProvider databaseProvider = DatabaseProvider();

  //Criando a instância do Repositorio Estado
  EstadoRepository estadoRepository = EstadoRepository(databaseProvider);

  Estado estado = Estado();
  estado.nome = "Rio de Janeiro";
  estado.uf = "RJ";
  estado.ufibge = "32";
  
  //estadoRepository.insert(estado);
  //estadoRepository.insert(estado);
  estado = await estadoRepository.findById(1);
  print(estado);




}