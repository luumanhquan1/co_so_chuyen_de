import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';

class HeaderMenuWidget extends StatelessWidget {
  const HeaderMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 29),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        image: DecorationImage(
          image: AssetImage(
            ImageAssets.headerMenu,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: backgroundColorApp.withOpacity(0.3),
              ),
            ),
            child: Container(
              height: 56,
              width: 56,
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
                child: CachedNetworkImage(
                  imageUrl:
                      'https://ttol.vietnamnetjsc.vn/images/2019/05/28/11/13/6106011515735339061107517025533698355232768n-1559011159003638303070.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Cao Tiến Dũng',
            style: textNormalCustom(
              color: AppTheme.getInstance().dfBtnTxtColor(),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Chủ tịch UBND tỉnh',
            style: textNormal(
              AppTheme.getInstance().dfBtnTxtColor().withOpacity(0.8),
              14,
            ),
          )
        ],
      ),
    );
  }
}
