import 'package:flutter/material.dart';
import 'package:flutter_food_express/presentation/screen/estado/estado_form_screen.dart';
import 'package:flutter_food_express/presentation/screen/estado/estado_search_screen.dart';
import 'package:flutter_food_express/presentation/screen/home_screen.dart';
import 'package:flutter_food_express/presentation/screen/usuarios/usuario_form_screen.dart';
import 'package:flutter_food_express/presentation/screen/usuarios/usuario_search_screen.dart';

///Classe responsável por definir as rotas da aplicação
class RoutesNames{

/*As rotas devem ser armazenadas em uma variável do tipo Map. Essa variável
do tipo Map deve armazenar a chave como o tipo String e o valor do 
tipo Widget Function(BuildContext context)
 */
static Map<String, Widget Function(BuildContext context)> routesNames = {
    HomeScreen.routName : (context) => HomeScreen(),
    EstadoSearchScreen.routName :(context) => const EstadoSearchScreen(),
    EstadoFormScreen.routName :(context) => const EstadoFormScreen(),
    UsuarioSearchScreen.routeName : (context) => const UsuarioSearchScreen(),
    UsuarioFormScreen.routeName : (context) => const UsuarioFormScreen(),

  };

}