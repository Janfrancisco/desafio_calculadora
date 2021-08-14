import 'package:get/get.dart';

class MyIMCController extends GetxController {
  final _obj = 'Digite seu dados. O resultado aparecerá aqui!'.obs;
  final _height = 10.obs;
  final _weight = 10.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  set height(value) => this._height.value = value;
  get height => this._height.value;

  set weight(value) => this._weight.value = value;
  get weight => this._weight.value;

  void imcCalculate(String mHeight, String mWeight) {
    double weight = double.parse(mWeight);
    double height = double.parse(mHeight);
    double imc = weight / (height * height);

    if (imc < 18.5) {
      obj = "Seu IMC é: ${imc.toStringAsFixed(2)} Magreza ";
    } else if (imc >= 18.5 && imc < 24.9) {
      obj = "Seu IMC é: ${imc.toStringAsFixed(2)} Normal";
    } else if (imc >= 24.9 && imc < 29.9) {
      obj = "Seu IMC é: ${imc.toStringAsFixed(2)} Sobrepeso";
    } else if (imc >= 29.9) {
      obj = "Seu IMC é: ${imc.toStringAsFixed(2)} Obesidade ";
    }
    resetFields();
  }

  void resetFields() {
    height = null;
  }
}
