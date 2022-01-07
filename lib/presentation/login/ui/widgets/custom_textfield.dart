import 'package:ccvc_mobile/presentation/login/bloc/login_cubit.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool isPass;
  final String? textHint;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final LoginCubit loginCubit;
  final Function(String text)? onChange;
  final Function(String text)? onSubmit;

  const CustomTextField(
      {Key? key,
      this.focusNode,
      this.controller,
      this.onChange,
      this.onSubmit,
      this.textHint,
      this.prefixIcon,
      required this.isPass,
      required this.loginCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: loginCubit.isShowPassword,
      builder: (context, snapshot) {
        final bool data = snapshot.data ?? true;
        bool chekPassWord;
        if (isPass) {
          chekPassWord = data;
        } else {
          chekPassWord = false;
        }
        return TextFormField(
          obscureText: chekPassWord,
          focusNode: focusNode,
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: Colors.black12,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: Visibility(
              visible: isPass,
              child: IconButton(
                icon: const Icon(Icons.stream),
                onPressed: () {
                  loginCubit.getIsShowPassWord(isShow: !data);
                },
              ),
            ),
            isCollapsed: true,
            fillColor: const Color(0xffE2E8F0).withOpacity(0.1),
            filled: true,
            hintText: textHint,
            hintStyle: const TextStyle(
              color: Colors.black12,
              fontSize: 14,
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(color: Color(0xffE2E8F0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(color: Color(0xffE2E8F0)),
            ),
          ),
          onChanged: (text) {
            onChange != null ? onChange!(text) : null;
          },
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'email must not be empty';
            }
            return null;
          },
          onFieldSubmitted: (text) {
            onSubmit != null ? onSubmit!(text) : null;
          },
        );
      },
    );
  }
}
