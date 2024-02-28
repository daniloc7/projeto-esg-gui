// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController textEditingController;
  dynamic returnValue;
  String regExp;
  List<dynamic>? arguments;
  bool isString;
  CustomTextFormField({
    Key? key,
    required this.textEditingController,
    required this.returnValue,
    required this.regExp,
    this.arguments,
    this.isString = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(regExp))
        // FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-ZÀ-ú ]*$'))
      ],
      validator: (value) {
        if (value!.trim().isEmpty) {
          return arguments![0];
        }
        if (isString) {
          if (value.trim().length <= arguments![1]) {
            return arguments![2];
          }
        }
        return null;
      },
      style: const TextStyle(fontSize: 17),
      onSaved: (value) {
        returnValue = value;
      },
      decoration: InputDecoration(
        labelText: arguments![3],
        // hintText: arguments![4],
        prefixIcon: Icon(Icons.food_bank_outlined),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
