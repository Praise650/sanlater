import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final int lines;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final String? hintText;
  final VoidCallback? iconOnPressed;
  final Widget suffixIcon;
  final bool showIcon;
  final bool enabled;
  final InputBorder? border;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  // void Function(String)? onChanged;
  InputField({
    Key? key,
    this.iconOnPressed,
    this.suffixIcon = const Text(''),
    this.hintText,
    this.showIcon=false,
    this.lines = 1,
    this.inputType,
    this.validator,
    // this.onChanged,
    this.inputFormatters,
    this.obscureText=false,
   this.controller,
    this.enabled = true,
    this.border,
    this.readOnly=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
      child: TextFormField(
        readOnly: readOnly,
        enabled: enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction, 
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        minLines: lines,
        maxLines: lines,
        keyboardType: inputType,
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.start,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          errorStyle: TextStyle(
            height: 0,
          ),
          suffixIcon: showIcon == true?TextButton(
            onPressed: iconOnPressed,
            child: suffixIcon,
          ): null,
          border: border,
        ),
        onSaved: (String? value){
          String control = controller.toString();
          control=value.toString();
          print('$control'+ ' value of reuseable textfield');
        },
      ),
    );
  }
}
