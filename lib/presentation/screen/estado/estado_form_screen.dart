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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Estado'),
      ),
      body: Container(),
    );
  }

  


}