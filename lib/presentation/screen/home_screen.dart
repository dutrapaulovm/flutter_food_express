import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  //Define o item selecionado no menu Drawer
  int _selectedIndex = 0;

  HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(
            title: const Text('Food Express'),
          ),
          drawer: Drawer(
            child: _drawer(context)
            ),
          body: Container(),
        );
    
  }  
  
  /// Método responsável por criar o menu Drawer 
  /// da aplicação
  Widget _drawer(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(child: Text("Home")),
        ListTile(
            title: const Text("Usuário"),
            selected: _selectedIndex == 0,
            leading: const Icon( Icons.people ),
            onTap: () {
                //Fecha o menu
                Navigator.pop(context);
            },
        )

      ],

    );
  }

}