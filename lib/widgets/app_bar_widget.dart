

import 'package:alilogi/commons/constants/image_constants.dart';
import 'package:alilogi/presentation/journey/widgets/app_image.dart';
import 'package:alilogi/presentation/theme/theme_color.dart';
import 'package:alilogi/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_touchable.dart';

class AppBarWidget extends GetView implements PreferredSizeWidget{
  const AppBarWidget({
    Key? key,
//    this.leading,
//    this.flexibleSpace,
    this.hasLeading = false,
    this.title = '',
 //   this.titleStyle,
 //   this.centerTitle = true,
   this.onPressed,
    this.actions,
 //   this.elevation,
   // this.titleSize,
   // this.backgroundColor,
  //  this.leadingIcon,
  //  this.leadingColor,
 //   this.titleColor,
  }) : super(key: key);

//  final Widget? leading;
//  final Widget? flexibleSpace;
//  final IconData? leadingIcon;
//  final Color? leadingColor;
  final bool hasLeading;
  final String title;
 // final TextStyle? titleStyle;
  final Function()? onPressed;
  final List<Widget>? actions;
  //final double? titleSize;

  @override
  Widget build(BuildContext context) {
   return    AppBar(
     //   flexibleSpace: flexibleSpace ?? const SizedBox.shrink(),
     automaticallyImplyLeading: hasLeading,
     leading: !hasLeading
         ?  const SizedBox.shrink()
         : GestureDetector(
       onTap:  onPressed ,
       child: Container(
           alignment: Alignment.centerRight,
           child: AppImage.asset(path: ImageConstants.icLeft, color: AppColors.grey,height: 24.sp,width: 24.sp,)),
     ),
     leadingWidth: !hasLeading?0:40.sp,
     centerTitle: false,
     title: Text(
       title,
       overflow: TextOverflow.ellipsis,
       style: ThemeText.heading4.copyWith(color: AppColors.indigo, height: 1.5),
     ),
     actions: actions,
     elevation:  0,
     backgroundColor:AppColors.white,
     // ),
   );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.h);



}
