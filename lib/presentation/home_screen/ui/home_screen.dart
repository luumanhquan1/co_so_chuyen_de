import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/header_widget.dart';

import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
HomeCubit homeCubit=HomeCubit();
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
        backgroundColor: homeColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            S.current.home,
            style: textNormalCustom(
                fontSize: 18, color: AppTheme.getInstance().backGroundColor(),),
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
                    children: List.generate(HomeItemType.values.length, (index) {
                      final type = HomeItemType.values[index];
                      return type.getItems();
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
class HomeProvider extends InheritedWidget {
  final HomeCubit homeCubit;
  const HomeProvider({
    Key? key,
    required this.homeCubit,
    required Widget child,
  }) : super(key: key, child: child);
  static HomeProvider of(BuildContext context){
    final HomeProvider? result=context.dependOnInheritedWidgetOfExactType<HomeProvider>();
    assert(result!=null,'No elenment');
    return result!;
  }
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

