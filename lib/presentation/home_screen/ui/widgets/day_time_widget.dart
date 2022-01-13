import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/clock_widget.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class DayTimeWidget extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  const DayTimeWidget({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ClockWidget(),
            RichText(
              text: TextSpan(
                text: 'AQI: ',
                style: titleText(color: AqiColor, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: "49 (Tốt)",
                    style: titleText(
                      color: Colors.green,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(
                  "Thứ 3, ngày 27 tháng 04 năm 2021",
                  style: textNormalCustom(
                    color: AppTheme.getInstance().titleColor(),
                    fontSize: 14.0.textScale(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                "16 tháng 3 (Đ), Tân Sửu",
                style: textNormal(AqiColor.withOpacity(0.8), 14.0.textScale()),
              ),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: processingColor,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Ngày hoàng đạo",
                    style: textNormal(
                      AqiColor.withOpacity(0.8),
                      14.0.textScale(),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
