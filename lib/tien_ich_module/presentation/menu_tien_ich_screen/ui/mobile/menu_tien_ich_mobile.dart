import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/menu_tien_ich_screen/ui/menu_item_tien_ich.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/menu_tien_ich_screen/ui/widget/menu_item_tien_ich.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class MenuTienIchMobile extends StatefulWidget {
  const MenuTienIchMobile({Key? key}) : super(key: key);

  @override
  _MenuTienIchMobileState createState() => _MenuTienIchMobileState();
}

class _MenuTienIchMobileState extends State<MenuTienIchMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(S.current.tien_ich),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImageAssets.image_tien_ichPng),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  children: List.generate(listFeatureTienIch.length, (index) {
                final type = listFeatureTienIch[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => type.getScreenTienIch(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: MenuItemTienIch(
                      title: type.getItemTienIch().title,
                      urlIcon: type.getItemTienIch().url,
                    ),
                  ),
                );
              })),
            )
          ],
        ),
      ),
    );
  }
}
