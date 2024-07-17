import 'package:flutter/material.dart';
import 'package:flutter_food_express/data/database_provider.dart';
import 'package:flutter_food_express/domain/models/estado.dart';
import 'package:flutter_food_express/domain/repositories/estado_repository.dart';
import 'package:flutter_food_express/presentation/widgets/helper_widgets.dart';

class EstadoFormScreen extends StatefulWidget {

  /* Definindo o nome da rota para Janela. Definimos o atributo
  como static para que possamos utilizar o nome da rota sem precisar
  criar a instância da classe. */
  static const String routName = "estadoForm";

  const EstadoFormScreen({ Key? key }) : super(key: key);

  @override
  _EstadoFormScreenState createState() => _EstadoFormScreenState();

}

class _EstadoFormScreenState extends State<EstadoFormScreen> {
  
  /*Utilizado para validar, resetar ou salvar os dados associar
  ao Widget Form*/
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  
  /*Para cada campo do tipo TextField e TextFormField devemos utilizar 
  um objeto do tipo TextEditingController para acessar os seus valores.
  */
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _ufController   = TextEditingController();
  TextEditingController _ibgeController = TextEditingController();  

  //Objeto que representa a tabela Estado no Banco de dados
  Estado _estado = Estado();

  //Responsável pela conexão de dados
  DatabaseProvider _databaseProvider = DatabaseProvider();
  //Repositório para permitir realizar a inserção, exclusão e atualização
  //dos dados
  late EstadoRepository _estadoRepository;
  
  void initDatabase() async{
      //Cria a conexão com o banco de dados
      await _databaseProvider.open();
      _estadoRepository = EstadoRepository(_databaseProvider);      
  }

  @override
  void initState() {    
    super.initState();
    initDatabase();
  }
  
  void save() async{
      _estado.nome = _nomeController.text;
      _estado.uf   = _ufController.text;
      _estado.ufibge = _ibgeController.text;
      if (_estado.id == null){
        await _estadoRepository.insert(_estado);      
      }
      else{
        await _estadoRepository.update(_estado);      
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {                        
            /*A função validade permite validar os campos que estão dentro do 
            Widget Form. */
            if (!_formState.currentState!.validate()){
              showDialog(context: context, 
                    /*Aqui construimos a janela de diálogo */
                    builder: (context) {
                      return AlertDialog(
                        title : const Text("Aviso!"),
                        content: 
                        const Text("Preencha os campos obrigatórios!"),
                        actions: [
                            TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: const Text("OK"))],

                      )
                      
                      ;
                    },);
            }
            else{
                 save();       
                 Navigator.pop(context);
            }

          }, icon: const Icon(Icons.check)),
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.cancel),)
        ],        
        title: const Text('Cadastro Estado'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context){
    return Padding(padding: const EdgeInsets.all(16),
      child: Form(   
      key: _formState,
        child: Column(children: [
        Row(children: [
            HelperWidgets.createTextForm("Nome", 
                "Campo Obrigatório!", _nomeController)
        ],),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [                      
           HelperWidgets.createTextForm("UF", "Campo Obrigatório!"
                  , _ufController),
           const SizedBox(width: 16,),
           HelperWidgets.createTextForm("IBGE", "Campo Obrigatório!", _ibgeController),

           /*SizedBox(width: 100, child: Flexible(child: TextFormField(), )), 
           const SizedBox(height: 16,),
           SizedBox(width: 100, child: Flexible(child: TextFormField(), ))*/
        ],)
      ]), 
    
      )
    
    );
  }




}