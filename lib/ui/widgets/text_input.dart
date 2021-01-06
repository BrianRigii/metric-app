import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Icon icon;
  final int numlines;
  final bool obsecure;
  final Function validate;
  final FocusNode currentNode;
  final FocusNode nextNode;
  final TextInputType keyBoardType;
  final Icon suffixicon;
  final Function onchangedFunc;

  const TextInput(
      {this.label,
      this.controller,
      this.icon,
      this.numlines = 1,
      this.validate,
      this.currentNode,
      this.nextNode,
      this.keyBoardType = TextInputType.text,
      this.onchangedFunc,
      this.suffixicon,
      this.obsecure = false});

  _fieldFocusChange(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: numlines,
        obscureText: obsecure,
        focusNode: currentNode,
        controller: controller,
        onFieldSubmitted: (value) {
          if (nextNode != null) {
            _fieldFocusChange(context, currentNode, nextNode);
          }
        },
        onChanged: onchangedFunc,
        keyboardType: keyBoardType,
        validator: validate,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          isDense: true,
          labelText: label,
          suffixIcon: suffixicon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).errorColor, width: 1),
          ),
        ));
  }
}
