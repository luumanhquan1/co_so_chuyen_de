import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_ba_dien_tu.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CellListCaNhan extends StatelessWidget {
  final Items item;
  final int index;

  const CellListCaNhan({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: borderButtomColor),
        color: bgDropDown.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(ImageAssets.icTron),
                ],
              ),
            ),
            spaceW16,
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.hoTen ?? '',
                    style: textNormalCustom(fontSize: 16, color: titleColor),
                  ),
                  spaceH6,
                  Text(
                    S.current.nhan_vien,
                    style: tokenDetailAmount(
                      fontSize: 14,
                      color: unselectLabelColor,
                    ),
                  ),
                  spaceH12,
                  Row(
                    children: [
                      SvgPicture.asset(ImageAssets.icPhone),
                      spaceW16,
                      Flexible(
                        child: Text(
                          item.phoneDiDong ??
                              item.phoneCoQuan ??
                              item.phoneNhaRieng ??
                              '',
                          style:
                              tokenDetailAmount(fontSize: 14, color: dateColor),
                        ),
                      )
                    ],
                  ),
                  spaceH12,
                  Row(
                    children: [
                      SvgPicture.asset(ImageAssets.icMail),
                      spaceW16,
                      Flexible(
                        child: Text(
                          item.email ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              tokenDetailAmount(fontSize: 14, color: dateColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(ImageAssets.icEdit),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(ImageAssets.icDelete),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
