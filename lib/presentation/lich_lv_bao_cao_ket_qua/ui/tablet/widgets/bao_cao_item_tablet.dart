import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum StatusType { home, report, calendarWork, internalInteraction, menu }

class BaoCaoItemTablet extends StatelessWidget {
  final String status;
  final String content;
  final Color statusColor;
  final String fileName;

  const BaoCaoItemTablet({
    Key? key,
    required this.status,
    required this.content,
    required this.statusColor,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: cellColorborder),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 108,
                  child: Text(
                    S.current.status,
                    style: textNormalCustom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: infoColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        status,
                        style: textNormalCustom(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: statusColor,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(ImageAssets.ic_edit),
                          const SizedBox(
                            width: 28,
                          ),
                          SvgPicture.asset(ImageAssets.ic_delete_do),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 108,
                  child: Text(
                    S.current.noi_dung,
                    style: textNormalCustom(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: infoColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    content,
                    style: textNormalCustom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: titleCalenderWork,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 108,
                  child: Text(
                    S.current.file,
                    style: textNormalCustom(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: infoColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    fileName,
                    style: textNormalCustom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: numberOfCalenders,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
