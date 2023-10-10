// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class ImcObject {
  String peso;
  String altura;
  ImcObject({
    required this.peso,
    required this.altura,
  });

  static double calculaImc(String altura, String peso) {
    double alturaDouble = double.tryParse(altura) ?? 0.0;
    double pesoDouble = double.tryParse(peso) ?? 0.0;
    double imc = pesoDouble / pow((alturaDouble / 100), 2);

    return imc;
  }

  static String classificacao(double imc) {
    String resposta = "";
    if (imc < 16) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Magreza grave.";
    } else if (imc >= 16 && imc < 17) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Magreza moderada.";
    } else if (imc >= 17 && imc < 18.5) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Magreza leve.";
    } else if (imc >= 18.5 && imc < 25) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Saudável.";
    } else if (imc >= 25 && imc < 30) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Sobrepeso.";
    } else if (imc >= 30 && imc < 35) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Obesidade grau 1.";
    } else if (imc >= 35 && imc < 40) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Obesidade grau 2 (severa)";
    } else {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Obesidade grau 2 (mórbida)";
    }

    return resposta;
  }
}
