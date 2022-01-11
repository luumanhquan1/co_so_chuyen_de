import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFieldTablet extends StatefulWidget {
  final bool isPass;
  final String? textHint;
  final Widget? prefixIcon;
  final Function(String text)? onChange;
  final Function(String text)? onSubmit;

  const CustomTextFieldTablet(
      {Key? key,
      this.onChange,
      this.onSubmit,
      this.textHint,
      this.prefixIcon,
      required this.isPass})
      : super(key: key);

  @override
  State<CustomTextFieldTablet> createState() => _CustomTextFieldTabletState();
}

class _CustomTextFieldTabletState extends State<CustomTextFieldTablet> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:
          widget.isPass == true ? obscureText == false : obscureText == true,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Colors.black12,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        prefixIcon: SizedBox(width: 50, height: 14, child: widget.prefixIcon),
        prefixIconConstraints: const BoxConstraints(
          maxWidth: 56,
          maxHeight: 14,
        ),
        suffixIcon: Visibility(
          visible: widget.isPass,
          child: IconButton(
            icon: obscureText
                ? SvgPicture.asset(ImageAssets.imgView)
                : SvgPicture.asset(ImageAssets.imgViewHide),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 20),
        isCollapsed: true,
        fillColor: borderButtomColor.withOpacity(0.1),
        filled: true,
        hintText: widget.textHint,
        hintStyle: textNormalCustom(
            fontSize: 18,
            color: unselectedLabelColor,
            fontWeight: FontWeight.w400),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Colors.red),
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
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return S.current.khong_the_bo_trong;
        }
        return null;
      },
      onFieldSubmitted: (text) {
        widget.onSubmit != null ? widget.onSubmit!(text) : null;
      },
    );
  }
}
