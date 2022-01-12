import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/widgets/header_tablet_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreenTablet extends StatefulWidget {
  const HomeScreenTablet({Key? key}) : super(key: key);

  @override
  State<HomeScreenTablet> createState() => _HomeScreenTabletState();
}

class _HomeScreenTabletState extends State<HomeScreenTablet> {
  ScrollController scrollController = ScrollController();
  HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeCubit.loadApi();
  }

  @override
  Widget build(BuildContext context) {
    return HomeProvider(
      homeCubit: homeCubit,
      child: Scaffold(
        backgroundColor: bgTabletColor,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.bgAppBarTablet),
                fit: BoxFit.fill,
              ),
            ),
            child: Text("213"),
          ),
        ),
        body: SizedBox.expand(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const ClampingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              children: [
                const HeaderTabletWidget(),
                StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: HomeItemType.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    final type = HomeItemType.values[index];
                    return type.getItemsTablet();
                  },
                  staggeredTileBuilder: (int index) {
                    final type = HomeItemType.values[index];
                    if (type == HomeItemType.wordProcessState) {
                      return const StaggeredTile.fit(2);
                    }
                    return const StaggeredTile.fit(1);
                  },
                  mainAxisSpacing: 28,
                  crossAxisSpacing: 28,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
