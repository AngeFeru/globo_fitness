import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';
import '../shared/menu_botton.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtAltura = TextEditingController();
  final TextEditingController txtPeso = TextEditingController();
  final double fontSizeValue = 18;
  String resultado = '';
  bool esMetrico = true;
  bool esImperial = false;
  double? altura;
  double? peso;
  late List<bool> isSelected;
  String mensajeAltura = '';
  String mensajePeso = '';

  @override
  void initState() {
    isSelected = [esMetrico, esImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_adjacent_string_concatenation
    mensajePeso = 'Please insert your wheight in' + ' ' +
        ((esMetrico) ? 'kilos' : 'pounds');
    // ignore: prefer_adjacent_string_concatenation
    mensajeAltura = 'Please insert your height in' + ' ' +
        ((esMetrico) ? 'meters' : 'inches');
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      bottomNavigationBar: const MenuBotton(),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          // ignore: sort_child_properties_last
          ToggleButtons(children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:
                    Text('Metrica', style: TextStyle(fontSize: fontSizeValue))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child:
                    Text('Imperial', style: TextStyle(fontSize: fontSizeValue)))
          ], isSelected: isSelected, onPressed: toogleMeasure),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: txtAltura,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: mensajeAltura),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
                controller: txtPeso,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: mensajePeso)),
          ),
          ElevatedButton(
              // ignore: sort_child_properties_last
              child: Text('Calculate BMI',
                  style: TextStyle(fontSize: fontSizeValue)),
              onPressed: findBMI),
          Text(
            resultado,
            style: TextStyle(fontSize: fontSizeValue),
          )
        ]),
      ),
    );
  }

  void toogleMeasure(value) {
    if (value == 0) {
      esMetrico = true;
      esImperial = false;
    } else {
      esMetrico = false;
      esImperial = true;
    }
    setState(() {
      isSelected = [esMetrico, esImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtAltura.text) ?? 0;
    double wheight = double.tryParse(txtPeso.text) ?? 0;

    if (esMetrico) {
      bmi = wheight / (height * height);
    } else {
      bmi = wheight * 703 / (height * height);
    }
    setState(() {
      //  if (bmi == null) {
      //    resultado = 'Ingrese la altura y peso correctamente';
      //  } else {
      resultado = 'Your BMI is' + ' ' + bmi.toStringAsFixed(2);
      //   }
    });
  }
}
