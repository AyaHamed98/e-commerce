import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({Key? key,this.validator,this.onSaved,this.controller,this.hintTxt}) : super(key: key);
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  String? hintTxt;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      controller:controller ,
      decoration: InputDecoration(
        hintText: hintTxt,
      ),

    );
  }
}
