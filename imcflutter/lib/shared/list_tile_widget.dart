// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:imcflutter/model/imc_object.dart';
import 'package:imcflutter/provider/data_provider.dart';
import 'package:imcflutter/shared/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListTileWidget extends StatelessWidget {
  final String data = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final ImcObject imcObject;
  final id = UniqueKey();
  ListTileWidget({
    Key? key,
    required this.imcObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataProvider dataProvider = Provider.of<DataProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor,
      ),
      child: ListTile(
        iconColor: primaryColor,
        leading: Icon(
          Icons.person,
          size: MediaQuery.of(context).size.height * 0.1,
        ),
        title: Text(ImcObject.classificacao(
            ImcObject.calculaImc(imcObject.altura, imcObject.peso))),
        subtitle: Text(
            "Peso: ${imcObject.peso}, Altura: ${imcObject.altura} \n $data"),
        isThreeLine: true,
        trailing: IconButton(
          onPressed: () {
            dataProvider.excluirItem(id: id);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
