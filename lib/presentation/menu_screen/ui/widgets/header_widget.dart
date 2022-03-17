import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/domain/model/user_infomation_model.dart';
import 'package:ccvc_mobile/presentation/menu_screen/bloc/menu_cubit.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class HeaderMenuWidget extends StatelessWidget {
  final double paddingVertical;
  final String urlBackGround;
  final MenuCubit menuCubit;
  final Color overlayColor;
  const HeaderMenuWidget(
      {Key? key,
      this.paddingVertical = 29,
      this.urlBackGround = ImageAssets.headerMenu,
      required this.menuCubit,
      this.overlayColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 170,
                  width: double.infinity,
                  child: Image.asset(
                    urlBackGround,
                    fit: BoxFit.fill,
                  )),
              Container(
                height: 170,
                width: double.infinity,
                color: overlayColor,
              )
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: paddingVertical),
              child: StreamBuilder<UserInformationModel>(
                stream: menuCubit.getInforUser,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: backgroundColorApp.withOpacity(0.3),
                          ),
                        ),
                        child: Container(
                          height: 56.0.textScale(space: 8),
                          width: 56.0.textScale(space: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              width: 3,
                              color: backgroundColorApp.withOpacity(0.2),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(31),
                            child: data?.anhDaiDienFilePath == null
                                ? const SizedBox()
                                : CachedNetworkImage(
                                    imageUrl: data?.anhDaiDienFilePath ?? '',
                                    errorWidget: (context, url, error) =>
                                        Container(
                                            color: Colors.black,
                                            child: Image.asset(
                                                ImageAssets.anhDaiDienMacDinh)),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        data?.hoTen ?? '',
                        style: textNormalCustom(
                          color: AppTheme.getInstance().dfBtnTxtColor(),
                          fontSize: 16.0.textScale(),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        data?.chucVu ?? '',
                        style: textNormal(
                          AppTheme.getInstance()
                              .dfBtnTxtColor()
                              .withOpacity(0.8),
                          14.0.textScale(),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
