import 'package:calculator_imc/controllers/imc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CalculatorPage extends GetWidget {
  final MyIMCController controller = Get.put(MyIMCController());

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  var maskFormatterHeight =
      new MaskTextInputFormatter(mask: '#.##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC - WBC Sistemas"),
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
                  MyIMCController.to.imcCalculate(
                      heightController.text, weightController.text);
                  heightController.text = MyIMCController.to.height;
                  weightController.text = MyIMCController.to.weight;
                },
                child: Text('Calcular IMC'),
              ),
              SizedBox(
                height: 20,
              ),
              GetX<MyIMCController>(
                init: MyIMCController(),
                initState: (_) {},
                builder: (_) {
                  return Text(_.obj);
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
