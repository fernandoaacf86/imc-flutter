import 'package:flutter/material.dart';
import 'package:imcflutter/model/decorations.dart';
import 'package:imcflutter/model/imc_object.dart';
import 'package:imcflutter/provider/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../shared/colors.dart';
import '../shared/text_widget.dart';

class FloatingModalBottom extends StatelessWidget {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  FloatingModalBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final DataProvider dataProvider = Provider.of<DataProvider>(context);
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext bc) {
            return AlertDialog(
              title: Text("Adicionar"),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
                      ],
                      controller: pesoController,
                      decoration: InputDecoration(
                        label: Decorations.TextFieldDecoration("Peso - kg"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
                      ],
                      controller: alturaController,
                      decoration: InputDecoration(
                        label: Decorations.TextFieldDecoration("Altura - cm"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: primaryColorMaterialState,
                        ),
                        onPressed: () {
                          dataProvider.adicionar(
                            ImcObject(
                                peso: pesoController.text,
                                altura: alturaController.text),
                          );
                          pesoController.clear();
                          alturaController.clear();
                          Navigator.pop(context);
                        },
                        child: ButtonTextWidget(
                          string: "Salvar",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: primaryColorMaterialState,
                        ),
                        onPressed: () {
                          pesoController.clear();
                          alturaController.clear();
                          Navigator.pop(context);
                        },
                        child: const ButtonTextWidget(
                          string: "Cancelar",
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
