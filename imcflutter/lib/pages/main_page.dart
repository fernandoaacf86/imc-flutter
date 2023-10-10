import 'package:flutter/material.dart';
import 'package:imcflutter/provider/data_provider.dart';
import 'package:provider/provider.dart';
import 'floating_modal_bottom.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Calculadora de IMC",
            style: TextStyle(fontSize: 27),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: ListView.builder(
            itemCount: dataProvider.listaDeWidgets.length,
            itemBuilder: (context, index) {
              return dataProvider.listaDeWidgets[index];
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: FloatingModalBottom(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: FloatingActionButton(
                onPressed: () => dataProvider.limparLista(),
                child: const Text("Limpar"),
              ),
            ),
          ],
        ));
  }
}
