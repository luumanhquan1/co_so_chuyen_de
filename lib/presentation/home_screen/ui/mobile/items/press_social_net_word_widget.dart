import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/domain/model/home/press_network_model.dart';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/bloc/home_cubit.dart';

import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';

import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/presentation/webview/web_view_screen.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/widgets/text/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PressSocialNetWork extends StatefulWidget {
  final WidgetType homeItemType;
  const PressSocialNetWork({Key? key, required this.homeItemType})
      : super(key: key);

  @override
  State<PressSocialNetWork> createState() => _PressSocialNetWorkState();
}

class _PressSocialNetWorkState extends State<PressSocialNetWork> {
  late HomeCubit cubit;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    cubit = HomeProvider.of(context).homeCubit;
    cubit.getPress();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundWidget(
      title: S.current.press_socialNetWord,
      onTapIcon: () {
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: DialogSettingWidget(
        labelWidget: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              SvgPicture.asset(ImageAssets.icTag),
              const SizedBox(
                width: 9,
              ),
              Text(
                'Chỉnh sửa tag',
                style: textNormalCustom(
                  fontSize: 14,
                  color: textDefault,
                ),
              )
            ],
          ),
        ),
        type: widget.homeItemType,
        listSelectKey: [
          DialogData(
            title: S.current.time,
            key: [
              SelectKey.HOM_NAY,
              SelectKey.TUAN_NAY,
              SelectKey.THANG_NAY,
              SelectKey.NAM_NAY
            ],
          )
        ],
      ),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          tagWidget(cubit),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StreamBuilder<List<PressNetWorkModel>>(
              stream: cubit.getPressNetWork,
              builder: (context, snapshot) {
                final data = snapshot.data ?? <PressNetWorkModel>[];
                if (data.isNotEmpty) {
                  return Column(
                    children: List.generate(data.length, (index) {
                      final result = data[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => WebViewScreen(
                                  title: '',
                                  url: result.url,
                                ),
                              ),
                            );
                          },
                          child: baoChiWidget(result),
                        ),
                      );
                    }),
                  );
                }
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: NodataWidget(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget baoChiWidget(PressNetWorkModel data) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: borderColor.withOpacity(0.5),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: shadowContainerColor.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 90,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  data.avatar,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.title,
                  style: textNormal(
                    titleColor,
                    14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    SvgPicture.asset(ImageAssets.icCalendarUnFocus),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      DateTime.parse(data.publishedTime).formatDdMMYYYY,
                      style: textNormal(
                        infoColor,
                        14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 29),
                  child: Text(
                    data.domain,
                    style: textNormal(
                      linkColor,
                      14,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tagWidget(HomeCubit cubit) {
    return SizedBox(
      height: 26,
      child: StreamBuilder<List<TagModel>>(
        initialData: const [],
        stream: cubit.getTag,
        builder: (context, snapshot) {
          final data = snapshot.data ?? <TagModel>[];
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final result = data[index];
              return GestureDetector(
                onTap: () {
                  cubit.selectTag(result);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: result.select
                        ? linkColor
                        : radioFocusColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Text(
                    '#${result.title}',
                    style: textNormal(
                      result.select
                          ? AppTheme.getInstance().dfBtnTxtColor()
                          : linkColor,
                      12,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
