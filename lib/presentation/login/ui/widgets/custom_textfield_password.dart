import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class CustomTextFieldPassWord extends StatefulWidget {
  final String? textHint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function onPressSuffix;
  final Function(String text)? onChange;
  final Function(String text)? onSubmit;
  final String? Function(String?)? validate;
  final double? sizeWith;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isInput;

  const CustomTextFieldPassWord({
    Key? key,
    this.onChange,
    this.onSubmit,
    this.textHint,
    this.prefixIcon,
    this.suffixIcon,
    required this.onPressSuffix,
    this.validate,
    this.sizeWith,
    this.controller,
    required this.obscureText,
    required this.isInput,
  }) : super(key: key);

  @override
  State<CustomTextFieldPassWord> createState() =>
      _CustomTextFieldPassWordState();
}

class _CustomTextFieldPassWordState extends State<CustomTextFieldPassWord> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.sizeWith,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Colors.black12,
        style: textNormalCustom(
          fontSize: 14.0.textScale(),
          fontWeight: FontWeight.normal,
          color: colorBlack,
        ),
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: widget.prefixIcon!,
            onPressed: () {},
          ),
          suffixIcon: widget.isInput
              ? IconButton(
                  icon: widget.suffixIcon!,
                  onPressed: () {
                    widget.onPressSuffix();
                  },
                )
              : const SizedBox(),
          contentPadding: const EdgeInsets.only(left: 20),
          isCollapsed: true,
          fillColor: bgDropDown.withOpacity(0.1),
          filled: true,
          hintText: widget.textHint,
          hintStyle: textNormalCustom(
            fontSize: 14.0.textScale(),
            color: unselectedLabelColor.withOpacity(0.5),
            fontWeight: FontWeight.w400,
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: canceledColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: bgDropDown),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: bgDropDown),
          ),
        ),
        onChanged: (text) {
          widget.onChange != null ? widget.onChange!(text) : null;
        },
        validator: widget.validate,
        onFieldSubmitted: (text) {
          widget.onSubmit != null ? widget.onSubmit!(text) : null;
        },
      ),
    );
  }
}
