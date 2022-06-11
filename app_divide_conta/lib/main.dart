import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Divide Conta",
        home: Conteudo(),
        debugShowCheckedModeBanner: false);
  }
}

class Conteudo extends StatefulWidget {
  const Conteudo({Key? key}) : super(key: key);

  @override
  State<Conteudo> createState() => _ConteudoState();
}

class _ConteudoState extends State<Conteudo> {
  final tValorConta = TextEditingController();
  final tQuantidadePessoas = TextEditingController();
  final tPorcentagemGarcom = TextEditingController();
  var informacao = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Divide Conta"), centerTitle: true),
      body: body(),
    );
  }

  body() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(labelText: "Valor da conta"),
            controller: tValorConta,
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration:
                const InputDecoration(labelText: "Quantidade de pessoas"),
            controller: tQuantidadePessoas,
          ),
          TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration:
                  const InputDecoration(labelText: "Porcentagem do garçom"),
              controller: tPorcentagemGarcom),
          ElevatedButton(onPressed: calcular, child: const Text("Calcular")),
          Text(informacao),
        ],
      ),
    );
  }

  calcular() {
    setState(() {
      if (validarDadosInformados()) {
        double valorContra = double.parse(tValorConta.text);
        double quantidadePessoas = double.parse(tQuantidadePessoas.text);
        double porcentagemGarcom = double.parse(tPorcentagemGarcom.text);
        if (validarMaiorZero(valorContra, quantidadePessoas)) {
          double valorTotalGarcomD = valorContra * (porcentagemGarcom / 100);
          double valorTotal = (valorContra + valorTotalGarcomD);
          double valorPorPessoaD = valorTotal / quantidadePessoas;
          informacao =
              montarInformacao(valorTotalGarcomD, valorPorPessoaD, valorTotal);
        } else {
          informacao = valorIgualZero(valorContra, quantidadePessoas);
        }
      } else {
        informacao = montarInformacaoValorInvalido();
      }
    });
  }

  String valorIgualZero(double validarMaiorZero, double quantidadePessoas) {
    var valorIgualZero = "";
    if (validarMaiorZero == 0.0) {
      valorIgualZero = "O valor da conta não pode ser zero";
    } else if (quantidadePessoas == 0.0) {
      valorIgualZero = "A quantidade de pessoas não pode ser zero";
    }
    return valorIgualZero;
  }

  String montarInformacaoValorInvalido() {
    var valorInformadoInvalido = "";
    if (tValorConta.text == "") {
      valorInformadoInvalido = "O valor da conta não é válido";
    } else if (tQuantidadePessoas.text == "") {
      valorInformadoInvalido = "A quantidade de pessoas não é válida";
    } else if (tPorcentagemGarcom.text == "") {
      valorInformadoInvalido = "A porcentagem do garçom não é válida";
    }
    return valorInformadoInvalido;
  }

  bool validarMaiorZero(double validarMaiorZero, double quantidadePessoas) {
    return validarMaiorZero > 0.0 && quantidadePessoas > 0.0;
  }

  bool validarDadosInformados() {
    return tValorConta.text != "" &&
        tQuantidadePessoas.text != "" &&
        tPorcentagemGarcom.text != "";
  }

  String montarInformacao(
      double valorTotalGarcomD, double valorPorPessoaD, double valorTotal) {
    String informacaoMontada = "";
    informacaoMontada =
        "Valor do garçom: ${formatarNumero(valorTotalGarcomD)}\n";
    informacaoMontada =
        "${informacaoMontada}Total por pessoa: ${formatarNumero(valorPorPessoaD)}\n";
    informacaoMontada =
        "${informacaoMontada}Total da conta: ${formatarNumero(valorTotal)}";

    return informacaoMontada;
  }

  String formatarNumero(double numero) {
    var realFormat =
        NumberFormat.currency(locale: 'pt_BR', decimalDigits: 2, symbol: '');
    return realFormat.format(numero);
  }
}
