import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? textEditingController;
  final String? Function(String?) validator;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTap;
  const CustomTextFormField(
      {super.key,
        required this.hintText,
        required this.labelText,
        required this.iconData,
        required this.textEditingController,
        required this.validator, required this.isNumber, this.obscureText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
          keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) :TextInputType.text,
          validator: validator,
          obscureText: obscureText == null || obscureText == false ? false : true,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            suffixIcon: InkWell( onTap:onTap, child: Icon(iconData)),
            label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(labelText),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          )),
    );
  }
}
