import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/mequee_widget.dart';
import 'package:ccvc_mobile/presentation/widget_manage/bloc/widget_manage_cubit.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PrevViewWidgetTablet extends StatefulWidget {
  const PrevViewWidgetTablet({Key? key}) : super(key: key);

  @override
  _PrevViewWidgetTabletState createState() => _PrevViewWidgetTabletState();
}

class _PrevViewWidgetTabletState extends State<PrevViewWidgetTablet>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  WidgetManageCubit cubit = WidgetManageCubit();
  HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.loadApi();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    homeCubit.loadApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
        S.current.xem_truoc_widget,
      ),
      body: HomeProvider(
        homeCubit: homeCubit,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 65,
                color: Colors.transparent,
                margin: const EdgeInsets.only(left: 16),
                child: const MarqueeWidget(),
              ),
              Container(
                color: homeColor,
                child: StreamBuilder<List<WidgetModel>>(
                  stream: cubit.listWidgetUsing,
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? <WidgetModel>[];
                    if (data.isNotEmpty) {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final int count = data.length;
                          final Animation<double> animation =
                              Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                              parent: animationController,
                              curve: Interval(
                                (1 / count) * index,
                                1.0,
                                curve: Curves.fastOutSlowIn,
                              ),
                            ),
                          );
                          if (animationController.status ==
                              AnimationStatus.dismissed) {
                            animationController.forward();
                          }
                          final type = data[index];
                          return AnimatedBuilder(
                            animation: animationController,
                            builder: (context, _) {
                              return FadeTransition(
                                opacity: animation,
                                child: Transform(
                                  transform: Matrix4.translationValues(
                                    0.0,
                                    100 * (1.0 - animation.value),
                                    0.0,
                                  ),
                                  child: type.widgetType?.getItemsTablet() ??
                                      const SizedBox(),
                                ),
                              );
                            },
                          );
                        },
                        staggeredTileBuilder: (int index) {
                          final type = data[index];
                          if (type.widgetType == WidgetType.wordProcessState) {
                            return const StaggeredTile.fit(2);
                          }
                          return const StaggeredTile.fit(1);
                        },
                        mainAxisSpacing: 28,
                        crossAxisSpacing: 28,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              )
              // Container(
              //   color: homeColor,
              //   child: StreamBuilder<List<WidgetModel>>(
              //     stream: cubit.listWidgetUsing,
              //     builder: (context, snapshot) {
              //       final data = snapshot.data ?? <WidgetModel>[];
              //       if (data.isNotEmpty) {
              //         return Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: List.generate(data.length, (index) {
              //             final type = data[index];
              //             return type.widgetType?.getItemsMobile() ??
              //                 const SizedBox();
              //           }),
              //         );
              //       }
              //       return const SizedBox();
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}