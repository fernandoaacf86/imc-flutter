// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:imcflutter/shared/colors.dart';

class ButtonTextWidget extends StatelessWidget {
  final String string;
  const ButtonTextWidget({
    Key? key,
    required this.string,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: TextStyle(fontSize: 20, color: corBranca),
    );
  }
}
