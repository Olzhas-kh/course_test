import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool obscureText;
  final TextInputType? keyboardType;
  final String hintText;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final double? height;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Color? color;
  final Color? borderColor;
  final Color? cursorColor;
  final List<TextInputFormatter>? inputFormatter;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
    final Color? textColor;
      final Color? hintColor;


  const CustomTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintStyle,
      required this.controller,
      this.onChanged,
      this.errorText,
      this.validator,
      this.height,
      this.color,
      required this.obscureText,
      this.inputFormatter,
      this.borderColor,
      this.cursorColor, this.textStyle, this.focusNode, this.textColor, this.hintColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: color ?? Colors.transparent,
      ),
      child: TextFormField(
        focusNode: focusNode,
        inputFormatters: inputFormatter,
        obscureText: obscureText,
        validator: validator,
        cursorColor: cursorColor ?? Colors.black,
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        style: textStyle,
        decoration: InputDecoration(
          isDense: true,
          errorText: errorText,
          hintText: hintText,

          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: hintStyle,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide:
                BorderSide(color: borderColor ?? Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide:
                BorderSide(color: borderColor ?? Colors.black, width: 2),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
