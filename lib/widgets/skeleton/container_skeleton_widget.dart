import 'package:alilogi/commons/constants/app_dimens.dart';
import 'package:alilogi/presentation/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'skeleton_widget.dart';

class ContainerSkeletonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;

  const ContainerSkeletonWidget({Key? key, this.height, this.width, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? AppDimens.width_60,
      height: height ?? 86.h,
      child: SkeletonWidget(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? AppDimens.radius_12),
              shape: BoxShape.rectangle,
              color: AppColors.white),
        ),
      ),
    );
  }
}
