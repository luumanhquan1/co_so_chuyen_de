import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final List<Widget>? acction;
  final Widget? leading;
  final String title;
  const AppBarWidget({
    Key? key,
    this.acction,
    this.leading,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.bgAppBarTablet),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leading ?? const SizedBox(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: acction ?? [],
                  )
                ],
              ),
            ),
            Center(
              child: Text(
                title,
                style: textNormalCustom(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 100);
}
