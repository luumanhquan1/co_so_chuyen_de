import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/bloc/chi_tiet_lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/ui/widget/iteam_menu_chi_tiet_lich_hop.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_lam_viec/ui/widget/row_value_widget.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/expand_group.dart';
import 'package:ccvc_mobile/widgets/show_buttom_sheet/show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

// todo chi tiet van ban
class DetailMeetCalenderScreen extends StatefulWidget {
  @override
  State<DetailMeetCalenderScreen> createState() =>
      _DetailMeetCalenderScreenState();
}

class _DetailMeetCalenderScreenState extends State<DetailMeetCalenderScreen> {
  late DetailMeetCalenderCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = DetailMeetCalenderCubit();
    cubit.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: backgroundColorApp,
        bottomOpacity: 0.0,
        elevation: APP_DEVICE == DeviceType.MOBILE ? 0 : 0.7,
        shadowColor: bgDropDown,
        automaticallyImplyLeading: false,
        title: Text(
          S.current.chi_tiet_lich_hop,
          style: titleAppbar(fontSize: 18.0.textScale(space: 6.0)),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset(
            ImageAssets.icBack,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: SvgPicture.asset(ImageAssets.icBacham),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: listChiTietLichHop
                        .map(
                          (e) => GestureDetector(
                        onTap: () {
                          showBottomSheetCustom(
                            context,
                            title: e.name,
                            child: e.chiTietLichHop
                                .getScreenChiTietLichHop(),
                          );
                        },
                        child: itemListKetThuc(
                          name: e.name,
                          icon: e.icon,
                        ),
                      ),
                    )
                        .toList(),
                  ),
                )
              ];
            },
          )
        ],
      ),
      body: DetailMeetCalendarInherited(
        cubit: cubit,
        child: ExpandGroup(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 12,
                              color: statusCalenderRed,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              S.current.hop_noi_bo_cong_ty,
                              style: textNormalCustom(
                                color: textTitle,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        StreamBuilder<ChiTietLichLamViecModel>(
                          stream: cubit.chiTietLichLamViecStream,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container();
                            }

                            final data = snapshot.data;

                            return Column(
                              children: data
                                      ?.dataRow()
                                      .map(
                                        (e) => Container(
                                          margin:
                                              const EdgeInsets.only(top: 24),
                                          child: RowValueWidget(
                                            row: e,
                                            isTablet: false,
                                          ),
                                        ),
                                      )
                                      .toList() ??
                                  [Container()],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // CongTacChuanBiWidget(),
                // MoiNguoiThamGiaWidget(),
                // TaiLieuWidget(),
                // PhatBieuWidget(),
                // BieuQuyetWidget(),
                // KetLuanHopWidget(),
                // YKienCuocHopWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemListKetThuc({required String icon, required String name}) {
    return SizedBox(
      width: 170,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: SvgPicture.asset(icon)),
          SizedBox(
            width: 10.0.textScale(),
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: textNormalCustom(
                    color: textTitle,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0.textScale(),
                  ),
                ),
                SizedBox(
                  height: 14.0.textScale(),
                ),
                Container(
                  height: 1,
                  color: borderColor.withOpacity(0.5),
                ),
                SizedBox(
                  height: 14.0.textScale(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailMeetCalendarInherited extends InheritedWidget {
  DetailMeetCalenderCubit cubit;

  DetailMeetCalendarInherited(
      {Key? key, required this.cubit, required Widget child})
      : super(key: key, child: child);

  static DetailMeetCalendarInherited of(BuildContext context) {
    final DetailMeetCalendarInherited? result = context
        .dependOnInheritedWidgetOfExactType<DetailMeetCalendarInherited>();
    assert(result != null, 'No element');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
