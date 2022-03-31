import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ItemListBangTinTablet extends StatelessWidget {
  String tin;
  bool isCheck;
  Function() onclick;

  ItemListBangTinTablet(
      {Key? key,
        required this.tin,
        required this.isCheck,
        required this.onclick,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:isCheck? linkColor.withOpacity(0.05):backgroundColorApp,
      // margin: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: (){
          onclick();
        },
        child: Row(
          children: [
            if (isCheck)
              const Icon(
                Icons.double_arrow,
                color: dangXyLyColor,
                size: 16,
              )
            else
              Container(
                width: 14,
              ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.brightness_1,
              color: isCheck ? dangXyLyColor : sideTextInactiveColor,
              size: 12,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(

                  tin,
                  style: textNormalCustom(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: isCheck ? bgButtonDropDown : infoColor,
                  ),
                  softWrap: true,
                  maxLines: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
