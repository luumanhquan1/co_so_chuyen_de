import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendSmsWidget extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final Function(String) sendTap;
  const SendSmsWidget({Key? key, this.hintText, this.controller, this.onChange,required this.sendTap})
      : super(key: key);

  @override
  State<SendSmsWidget> createState() => _SendSmsWidgetState();
}

class _SendSmsWidgetState extends State<SendSmsWidget> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      margin: EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: colorBlack.withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 15,
          )
        ],
      ),
      child: TextFormField(

        onChanged: (value) {
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },
        controller: controller,
        style: textNormal(titleCalenderWork, 15),
        decoration: InputDecoration(
          filled: true,
          hintText: widget.hintText ?? S.current.search_for_contacts,
          hintStyle: textNormal(hintColor, 12),
          fillColor: backgroundColorApp,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          suffixIcon: SizedBox(
              width: 88,
              child: GestureDetector(onTap: (){
             if(controller.text.isNotEmpty){
               widget.sendTap(controller.text);
               controller.text = '';
             }
              },child: Center(child: SvgPicture.asset(ImageAssets.icSendSms)))),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
        ),
      ),
    );
  }
}
