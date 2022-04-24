import 'package:alilogi/commons/constants/app_dimens.dart';
import 'package:alilogi/commons/constants/image_constants.dart';
import 'package:alilogi/commons/constants/string_constants.dart';
import 'package:alilogi/presentation/journey/widgets/app_image.dart';
import 'package:alilogi/presentation/theme/theme_color.dart';
import 'package:alilogi/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HeaderWidget extends StatelessWidget {
  final String title;
  final String? subtitle;


  HeaderWidget({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppDimens.height_81,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 88.w),
          child: AppImage.asset(path: ImageConstants.loginBackground,),
        ),
        SizedBox(
          height: 8.5.h,
        ),
        Text(
          title,
          style: ThemeText.heading4.copyWith(color: AppColors.indigo),
        ),
        SizedBox(
          height: AppDimens.height_8,
        ),
        subtitle != null?Text(subtitle!,
            style: ThemeText.body6.copyWith(color: AppColors.grey)):SizedBox(),

      ],
    );
  }
}
