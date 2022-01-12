import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final bool isEnabled;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final int maxLine;

  const TextFormFieldWidget(
      {Key? key,
      this.controller,
      required this.isEnabled,
      this.onChange,
      this.validator,
      this.initialValue,
      this.maxLine = 1,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        initialValue: initialValue,
        keyboardType: textInputType,
        maxLines: maxLine,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(fontWeight: FontWeight.w400),
        enabled: isEnabled,
        decoration: InputDecoration(
            contentPadding: maxLine == 1
                ? const EdgeInsets.symmetric(vertical: 4, horizontal: 10)
                : null,
            fillColor: isEnabled
                ? Colors.transparent
                : Color(0xffDBDFEF).withOpacity(0.3),
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDBDFEF)),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDBDFEF)),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            )),
        validator: validator,
      ),
    );
  }
}
