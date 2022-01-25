import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThanhPhanThamGiaWidget extends StatefulWidget {
  const ThanhPhanThamGiaWidget({Key? key}) : super(key: key);

  @override
  _ThanhPhanThamGiaWidgetState createState() => _ThanhPhanThamGiaWidgetState();
}

class _ThanhPhanThamGiaWidgetState extends State<ThanhPhanThamGiaWidget> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0.textScale()),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.thanh_phan_tham_gia,
                style: textNormalCustom(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0.textScale(),
                  color: unselectedLabelColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  isExpand = !isExpand;
                  setState(() {});
                },
                child: isExpand
                    ? const Icon(
                        Icons.keyboard_arrow_up_rounded,
                        color: AqiColor,
                      )
                    : const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AqiColor,
                      ),
              )
            ],
          ),

          Container()
        ],
      ),
    );
  }
}
