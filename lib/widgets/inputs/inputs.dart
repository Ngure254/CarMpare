import 'package:flutter/material.dart';
import 'package:car_list/helpers/color.helper.dart';

class InputField extends StatelessWidget {
  final String hint;
  final TextInputType inputType;

  const InputField({Key? key, required this.hint, required this.inputType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        border: Border.all(color: ColorsData.DarkBg,),
      ),
      child: TextField(
        keyboardType: inputType,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: ColorsData.DarkBg),
            border: InputBorder.none),
      ),
    );
  }
}
