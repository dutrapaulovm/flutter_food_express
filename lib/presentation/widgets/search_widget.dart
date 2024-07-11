import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {

  String title;  
  String routeNameForm;

  SearchWidget({ Key? key, 
          required this.title,
          required this.routeNameForm          
          }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title: Text(title),        
      ),
      body: _body(context),
      floatingActionButton: 
          FloatingActionButton(child: const Icon(Icons.add),
          onPressed: () async{
              await Navigator.pushNamed(context, routeNameForm);
          },),     
    );
  }

  Widget _body(BuildContext context){
      return Padding(padding: const EdgeInsets.all(16),
        child: Column(
          children: [
              _createSearchTextField(context),
              SizedBox(height: 16,),
              //_createListView(context)
          ]),
      );
  }

  Widget _createSearchTextField(BuildContext context){
      return Row(children: [
            Flexible(child: 
                TextField(decoration: InputDecoration(
                                  labelText: "Pesquisar...",
                                  suffixIcon: Icon(Icons.search)
                                ),
                        )
                )
        ],
      );
  }
/*
  /// Método responsável por criar a estrutura do listview no qual
  /// exibirá os dados do banco de dados  
  Widget _createListView(BuildContext context){

      if (_results.isEmpty)
      {
        return Text("Nenhum dado encontrado!", 
            style: TextStyle(fontSize: 20),);
      }
      else
      return Expanded(         
        child : SizedBox(     
              height: 150,
              child: ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {        
                        /* O componente GestureDetector permite que coloquemos
                        um efeito de clique em cada item da lista */
                        return GestureDetector(
                              onTap: () {                                                                
                              },
                              child: ListTile(title: 
                                Text(_results[index].nome!)
                              ,),
                        );
                    } 
                  )
              )
      );

  }
*/

}