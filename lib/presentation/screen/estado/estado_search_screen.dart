
import 'package:flutter/material.dart';
import 'package:flutter_food_express/data/database_provider.dart';
import 'package:flutter_food_express/domain/models/estado.dart';
import 'package:flutter_food_express/domain/repositories/estado_repository.dart';
import 'package:flutter_food_express/presentation/screen/estado/estado_form_screen.dart';
import 'package:flutter_food_express/presentation/widgets/search_widget.dart';

/// Janela responsável por realizar a pesquisa dos
/// estados e também possuí um botão para chamar a janela
/// de cadastro dos estados.
class EstadoSearchScreen extends StatefulWidget {
  
  /* Definindo o nome da rota para Janela. Definimos o atributo
  como static para que possamos utilizar o nome da rota sem precisar
  criar a instância da classe. */
  static const String routName = "estado";

  const EstadoSearchScreen({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EstadoSearchScreenState();
}

class _EstadoSearchScreenState extends State<EstadoSearchScreen> {
  
  /*Armazena os resultado provinentes do banco de dados. Essa lista
  será utilizada para listar os dado no componente ListView. */
  List<Estado> _results = [];

  DatabaseProvider databaseProvider = DatabaseProvider();  
  late EstadoRepository estadoRepository;

  /**
   * Devemos sempre utilizar o método initState quando for necessário
   * inicializar algum recurso. Esse método é chamado antes de
   * inicializar o State desta interface.
   */
  @override
  void initState(){    
    super.initState();
    initDatabase();
  }
  
  ///
  ///Método responsável por abrir a conexão com o banco de dados
  ///e criar a instância da classe EstadoRepository e consultar
  ///todos estados e atribuir o resultado no objeto _result
  ///
  void initDatabase() async{
    await databaseProvider.open();
    estadoRepository = EstadoRepository(databaseProvider);
    _results = await estadoRepository.findAll(); 
  }

  @override
  Widget build(BuildContext context) {
    return SearchWidget(title: "Estado", 
              routeNameForm: EstadoFormScreen.routName,);
  }


}