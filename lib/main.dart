import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WBC Sistemas - Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'IMC Calculator - WBC Sistemas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  var maskFormatterHeight =
      new MaskTextInputFormatter(mask: '#.##', filter: {"#": RegExp(r'[0-9]')});
  String? _result;

  void resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
    });
  }

  void calculateImc() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double imc = weight / (height * height);

    if (imc < 18.5) {
      _result = "(${imc.toStringAsFixed(2)}) Magreza ";
    } else if (imc >= 18.5 && imc < 24.9) {
      _result = "(${imc.toStringAsFixed(2)}) Normal";
    } else if (imc >= 24.9 && imc < 29.9) {
      _result = "(${imc.toStringAsFixed(2)}) Sobrepeso";
    } else if (imc >= 29.9) {
      _result = "(${imc.toStringAsFixed(2)}) Obesidade ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Peso(Kg)', suffixText: 'Kg'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              inputFormatters: [maskFormatterHeight],
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Altura(m)',
                suffixText: 'm',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                print(weightController.text);
                calculateImc();
                resetFields();
              },
              child: Text('Calcular IMC'),
            ),
            SizedBox(
              height: 20,
            ),
            _result == null
                ? Text('Digite seu dados. O resultado aparecerá aqui!')
                : Text('Seu IMC é: $_result. ')
          ],
        ),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
