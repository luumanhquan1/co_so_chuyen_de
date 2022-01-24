import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/item_select_model.dart';
import 'package:ccvc_mobile/presentation/tao_lich_lam_viec_chi_tiet/ui/widget/title_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaiLichWidget extends StatefulWidget {
  const LoaiLichWidget({Key? key}) : super(key: key);

  @override
  _LoaiLichWidgetState createState() => _LoaiLichWidgetState();
}

class _LoaiLichWidgetState extends State<LoaiLichWidget> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          image: ImageAssets.icCalendarUnFocus,
          title: 'Loai lich',
          isExpand: true,
          onTap: () {
            setState(() {
              isCheck = !isCheck;
            });
          },
          icon: isCheck
              ? const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: AqiColor,
                )
              : const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AqiColor,
                ),
        ),
        if (isCheck)
          Column(
            children: listLoaiLich
                .map(
                  (e) => GestureDetector(
                    onTap: () {

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e.text,
                          style: textNormalCustom(
                            color: fontColorTablet2,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0.textScale(),
                          ),
                        ),
                        if (e.isSelect) const Icon(
                                Icons.check,
                                color: numberColorTablet,
                              ) else Container()
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        else
          Container()
      ],
    );
  }
}
