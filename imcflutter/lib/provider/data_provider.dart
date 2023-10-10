import 'package:flutter/material.dart';
import 'package:imcflutter/model/imc_object.dart';

import '../shared/list_tile_widget.dart';

class DataProvider extends ChangeNotifier {
  List<ListTileWidget> listaDeWidgets = [];

  void adicionar(ImcObject imcO) {
    listaDeWidgets.add(
      ListTileWidget(
        imcObject: ImcObject(
          peso: imcO.peso,
          altura: imcO.altura,
        ),
      ),
    );
    notifyListeners();
  }

  void excluirItem({required UniqueKey id}) {
    listaDeWidgets.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void limparLista() {
    listaDeWidgets.clear();
    notifyListeners();
  }
}
