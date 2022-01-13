import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/menu_screen/ui/menu_items.dart';
import 'package:ccvc_mobile/presentation/menu_screen/ui/widgets/header_widget.dart';
import 'package:ccvc_mobile/presentation/menu_screen/ui/widgets/menu_cell_widget.dart';
import 'package:ccvc_mobile/presentation/menu_screen/ui/widgets/text_button_widget.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:flutter/material.dart';

class MenuTabletScreen extends StatefulWidget {
  const MenuTabletScreen({Key? key}) : super(key: key);

  @override
  _MenuTabletScreenState createState() => _MenuTabletScreenState();
}

class _MenuTabletScreenState extends State<MenuTabletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: S.current.menu,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const HeaderMenuWidget(
              paddingVertical: 20,
            ),
           const Padding(
              padding:  EdgeInsets.symmetric(vertical: 20),
              child: TextQuanLyWidget(),
            ),

            GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 28,
              mainAxisSpacing: 28,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: List.generate(listFeature.length, (index) {
                return Container(
                  color: Colors.red,
                );
              }),
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppTheme.getInstance().backGroundColor(),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: colorBlack.withOpacity(0.05),
                  )
                ],
                border: Border.all(color: borderColor.withOpacity(0.5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: lineColor),
                      ),
                    ),
                    child: Text(
                      S.current.cai_dat,
                      style: textNormalCustom(
                        color: labelColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(listFeatureAccount.length, (index) {
                      final type = listFeatureAccount[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => type.getScreen(),
                            ),
                          );
                        },
                        child: MenuCellWidget(
                          title: type.getItem().title,
                          urlIcon: type.getItem().url,
                          isBorder: index != listFeatureAccount.length - 1,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
