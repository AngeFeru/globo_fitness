import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';
import '../shared/menu_botton.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Globo Fitness')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBotton(),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/prueba.jpg'),
              fit: BoxFit.cover,
            )),
            child: Center(
                child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Text('Fitness App',
                        textAlign: TextAlign.center,
                        style: TextStyle(shadows: [
                          Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 2.0,
                              color: Colors.grey)
                        ], fontSize: 20, fontWeight: FontWeight.bold))))));
  }
}
