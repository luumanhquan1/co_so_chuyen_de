import 'package:alilogi/presentation/theme/theme_color.dart';
import 'package:alilogi/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailInfoWidget extends StatelessWidget {
  final String title;
  final String info1;
  final String? info2;
  final bool isHighlightTitle;
  final bool isHighlightInfo1;
  final bool isHighlightInfo2;
  final Color colorInfo1;

  DetailInfoWidget(
      {required this.title,
      required this.info1,
      this.info2,
      this.isHighlightTitle = false,
      this.isHighlightInfo1 = false,
      this.isHighlightInfo2 = false,
       this.colorInfo1 = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12.sp,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                softWrap: true,
                style: isHighlightTitle
                    ? ThemeText.body5.copyWith(color: AppColors.indigo)
                    : ThemeText.body6.copyWith(color: AppColors.grey),
              ),
            ),
            Visibility(
              visible: info2 != null,
              child: Expanded(
                child: Center(
                  child: Text(
                    info2 ?? '',
                    softWrap: true,
                    style: isHighlightInfo2
                        ? ThemeText.body5.copyWith(color: AppColors.indigo)
                        : ThemeText.body6.copyWith(color: AppColors.grey),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                info1,
                softWrap: true,
                textAlign: TextAlign.end,
                style: isHighlightInfo1
                    ? ThemeText.body5.copyWith(color: colorInfo1)
                    : ThemeText.body6.copyWith(color: AppColors.indigo),
              ),
            ),
          ],
        )
      ],
    );
  }
}
