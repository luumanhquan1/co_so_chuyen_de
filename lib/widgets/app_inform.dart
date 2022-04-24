import 'package:alilogi/commons/constants/app_dimens.dart';
import 'package:alilogi/presentation/theme/theme_color.dart';
import 'package:alilogi/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppInform extends GetView {
  AppInform({
    Key? key,
    this.backgroundColor,
    required this.title,
  }) : super(key: key);

  final Color? backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth - AppDimens.space_16 * 2,
      padding: EdgeInsets.all(AppDimens.space_10),
      margin: EdgeInsets.all(AppDimens.space_16),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.grey,
        borderRadius: BorderRadius.circular(AppDimens.radius_5),
      ),
      child: Text(
        title,
        maxLines: null,
        softWrap: true,
        style: ThemeText.body6.copyWith(color: AppColors.white),
      ),
    );
  }
}
