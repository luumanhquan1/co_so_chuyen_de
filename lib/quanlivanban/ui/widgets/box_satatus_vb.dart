import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/material.dart';
class BoxStatusVanBan extends StatelessWidget {
  final Color color;
  final String value;
  final String  statusName;
  final Function() onTap;
  const BoxStatusVanBan({Key? key,required this.color,required
  this.value,required this.onTap,required this.statusName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
        decoration: BoxDecoration(
          borderRadius:const BorderRadius.all(
            Radius.circular(6),
          ),
          color: radioUnfocusColor.withOpacity(0.1),
          border: Border.all(color: radioUnfocusColor),
        ),
        child: Column(
          children: [
            Text(
              value,
              style:  titleText(
                fontSize: 28,
                color: color,
              ),),
             Text(
              statusName,
               style: textNormal(
                 color,14,
               ),
             ),
          ],
        ),
      ),
    );
  }
}


