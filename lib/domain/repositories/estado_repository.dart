import 'package:flutter_food_express/data/database_provider.dart';
import 'package:flutter_food_express/domain/models/estado.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class EstadoRepository{

  late DatabaseProvider databaseProvider;

  EstadoRepository(this.databaseProvider);

  Future<int> insert(Estado entity) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    return await dt.insert("estado", entity.toMap());
  }

  Future<int>  delete(Estado entity) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    return await dt.delete("estado", 
                  where : "id = ?", 
                  whereArgs:  ["${entity.id}"]);
  }

  Future<int>  update(Estado entity) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    return await dt.update("estado",
                    entity.toMap(), 
                    where : "id = ?", 
                  whereArgs:  ["${entity.id}"]);
  }

  Future<Estado> findById(int id) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    List<Map<String, Object?>> result = await dt.rawQuery("SELECT * FROM ESTADO WHERE ID = ${id}");
    //Se retornou resultados
    var estado = Estado();
    if (result.isNotEmpty){
        Map<String, Object?> item = result[0];
        estado.id = item["ID"] as int;
        estado.nome = item["NOME"] as String;
        estado.ufibge = item["UFIBGE"] as String;
        estado.uf = item["UF"] as String;
    }
    return estado;
  }

  /// Busca todos os registro do banco de dados convertido para
  /// um objeto do tipo List<Estado>.   
  Future<List<Estado>> findAll() async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    List<Map<String, Object?>> result = await dt.rawQuery("SELECT * FROM ESTADO");
        
    List<Estado> estadoResults = [];
    
    //Se retornou resultados
    if (result.isNotEmpty){
        for (int i = 0; i < result.length; i++){            
            Map<String, Object?> item = result[i];
            //Convertendo um Map para o objeto apropriado
            Estado estado = Estado.fromMap(item);
            estadoResults.add(estado);
        }
    }
     
    return estadoResults;
  }  


}