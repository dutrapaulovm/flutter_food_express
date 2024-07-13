import 'package:flutter/material.dart';

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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {            
            
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
                        
            //Navigator.pop(context);

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
           Flexible(child: 
              TextFormField(
                decoration: InputDecoration(label: Text("Nome")),
                validator: (value) {
                  if (value != null && value.trim().isEmpty){
                     return "Campo obrigatório!";
                  } 
                },
              ), 
           ) 
        ],),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [                      
           Flexible(child: TextFormField(), ),
           const SizedBox(width: 16,),
           Flexible(child: TextFormField(), )

           /*SizedBox(width: 100, child: Flexible(child: TextFormField(), )), 
           const SizedBox(height: 16,),
           SizedBox(width: 100, child: Flexible(child: TextFormField(), ))*/
        ],)
      ]), 
    
      )
    
    );
  }

}