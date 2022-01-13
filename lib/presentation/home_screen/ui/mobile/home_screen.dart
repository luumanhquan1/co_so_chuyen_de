import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/widgets/header_widget.dart';

import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';

final keyHomeMobile = GlobalKey<_HomeScreenMobileState>();

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  ScrollController scrollController = ScrollController();
  HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeCubit.loadApi();
    homeCubit.configWidget();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    homeCubit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeProvider(
      homeCubit: homeCubit,
      child: Scaffold(
        backgroundColor: homeColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            S.current.home,
            style: textNormalCustom(
              fontSize: 18,
              color: AppTheme.getInstance().backGroundColor(),
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.appBarBackground),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: SizedBox.expand(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const ClampingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  const HeaderWidget(),
                  Column(
                    children: List.generate(WidgetType.values.length, (index) {
                      final type = WidgetType.values[index];
                      return type.getItemsMobile();
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
