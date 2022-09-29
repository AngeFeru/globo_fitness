import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/weather_screen.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/weather_screen.dart';
import '../screens/session_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children: buildMenuItems(
                context) //Llama la funcion menuItems para terminar de agregar todo al drawer
            ));
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training',
    ];
    List<Widget> menuItems =
        []; //Crea la lista de items del Drawer recorriendo el listado
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text('Globo Fitness',
            style: TextStyle(color: Colors.white, fontSize: 28))));
    for(var element in menuTitles ) {
    //menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(element, style: const TextStyle(fontSize: 18)),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = const IntroScreen();
                break;
              case 'BMI Calculator':
                screen = const BmiScreen();
                break;
              case 'Weather':
                screen = const WeatherScreen();
                break;
              case 'Training':
                screen = const SessionScreen();
                break;
              default:
            }
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => screen)));
          }));
    }
    return menuItems;
  }
}
