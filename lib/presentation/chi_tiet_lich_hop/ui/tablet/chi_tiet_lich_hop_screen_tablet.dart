import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/bloc/chi_tiet_lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/ui/phone/chi_tiet_lich_hop_screen.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/ui/widget/double_button.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_lam_viec/ui/widget/menu_select_widget.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_lam_viec/ui/widget/row_value_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/expand_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

// todo chi tiet van ban
class DetailMeetCalenderTablet extends StatefulWidget {
  @override
  State<DetailMeetCalenderTablet> createState() =>
      _DetailMeetCalenderTabletState();
}

class _DetailMeetCalenderTabletState extends State<DetailMeetCalenderTablet> {
  late DetailMeetCalenderCubit cubit;
  var _controller = TabController(vsync: AnimatedListState(), length: 7);
  late ScrollController scrollController;

  @override
  void initState() {
    _controller = TabController(vsync: AnimatedListState(), length: 7);
    cubit = DetailMeetCalenderCubit();
    scrollController = ScrollController();
    cubit.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgQLVBTablet,
      appBar: BaseAppBar(
        title: S.current.chi_tiet_lich_hop,
        leadingIcon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            ImageAssets.icBack,
          ),
        ),
        actions: [
          MenuSelectWidget(
            listSelect: [
              QData(
                urlImage: ImageAssets.icHuy,
                text: S.current.huy_lich_hop,
                onTap: () {},
              ),
              QData(
                  urlImage: ImageAssets.ic_delete_do,
                  text: S.current.xoa_lich,
                  onTap: () {}),
              QData(
                  urlImage: ImageAssets.icEditBlue,
                  text: S.current.sua_lich,
                  onTap: () {}),
              QData(
                urlImage: ImageAssets.icThuHoi,
                text: S.current.xoa_lich,
                onTap: () {},
              ),
              QData(
                  urlImage: ImageAssets.icPhanCongThuKy,
                  text: S.current.phan_cong_thu_ky,
                  onTap: () {}),
              QData(
                  urlImage: ImageAssets.icTaoBocBang,
                  text: S.current.phan_cong_thu_ky,
                  onTap: () {}),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 28, right: 30.0, left: 30.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
            color: backgroundColorApp,
          ),
          child: DefaultTabController(
            length: 7,
            child: NestedScrollView(
              headerSliverBuilder: (
                BuildContext context,
                bool innerBoxIsScrolled,
              ) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: DetailMeetCalendarInherited(
                      cubit: cubit,
                      child: ExpandGroup(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [],
                              ),
                              // child: StreamBuilder<ChiTietLichLamViecModel>(
                              //   stream: cubit.chiTietLichLamViecStream,
                              //   builder: (context, snapshot) {
                              //     if (!snapshot.hasData) {
                              //       return Container();
                              //     }
                              //
                              //     final data = snapshot.data;
                              //
                              //     final listText = data
                              //             ?.dataRow()
                              //             .where((element) =>
                              //                 element.type == typeData.text)
                              //             .toList() ??
                              //         [];
                              //
                              //     final listText1 = listText.sublist(0, 2);
                              //     final listText2 =
                              //         listText.sublist(3, listText.length);
                              //
                              //     return Column(
                              //       children: [
                              //         Row(
                              //           children: [
                              //             const Icon(
                              //               Icons.circle,
                              //               size: 16,
                              //               color: statusCalenderRed,
                              //             ),
                              //             const SizedBox(
                              //               width: 16,
                              //             ),
                              //             Text(
                              //               S.current.hop_noi_bo_cong_ty,
                              //               style: textNormalCustom(
                              //                 color: textTitle,
                              //                 fontSize: 20,
                              //                 fontWeight: FontWeight.w500,
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //         const SizedBox(
                              //           height: 28,
                              //         ),
                              //         Row(
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.start,
                              //           children: [
                              //             Expanded(
                              //               flex: 4,
                              //               child: Column(
                              //                 crossAxisAlignment:
                              //                     CrossAxisAlignment.start,
                              //                 children: [
                              //                   Column(
                              //                     children: listText1
                              //                         .map(
                              //                           (e) => Container(
                              //                             margin:
                              //                                 const EdgeInsets
                              //                                     .only(
                              //                               bottom: 24,
                              //                             ),
                              //                             child: RowValueWidget(
                              //                               row: e,
                              //                               isTablet: true,
                              //                               isMarinLeft: true,
                              //                             ),
                              //                           ),
                              //                         )
                              //                         .toList(),
                              //                   ),
                              //                   Column(
                              //                     children: listText2
                              //                         .map(
                              //                           (e) => Container(
                              //                             margin:
                              //                                 const EdgeInsets
                              //                                     .only(
                              //                               bottom: 24,
                              //                             ),
                              //                             child: RowValueWidget(
                              //                               row: e,
                              //                               isTablet: true,
                              //                             ),
                              //                           ),
                              //                         )
                              //                         .toList(),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             Expanded(
                              //               flex: 3,
                              //               child: Column(
                              //                 children: [
                              //                   DoubleButtonWidget(
                              //                     onPressed1: () {},
                              //                     onPressed2: () {},
                              //                   ),
                              //                   const SizedBox(
                              //                     height: 28,
                              //                   ),
                              //                   Row(
                              //                     children: [
                              //                       const Expanded(
                              //                         flex: 3,
                              //                         child: SizedBox(),
                              //                       ),
                              //                       Expanded(
                              //                         flex: 7,
                              //                         child: Column(
                              //                           crossAxisAlignment:
                              //                               CrossAxisAlignment
                              //                                   .start,
                              //                           children: (data
                              //                                       ?.dataRow()
                              //                                       .where(
                              //                                         (element) =>
                              //                                             element
                              //                                                 .type ==
                              //                                             typeData
                              //                                                 .listperson,
                              //                                       )
                              //                                       .toList())
                              //                                   ?.map(
                              //                                     (e) =>
                              //                                         RowValueWidget(
                              //                                       row: e,
                              //                                       isTablet:
                              //                                           true,
                              //                                     ),
                              //                                   )
                              //                                   .toList() ??
                              //                               [
                              //                                 Container(),
                              //                               ],
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     );
                              //   },
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ];
              },
              body: StickyHeader(
                overlapHeaders: true,
                header: TabBar(
                  controller: _controller,
                  unselectedLabelStyle: textNormalCustom(
                      fontSize: 16, fontWeight: FontWeight.w400),
                  indicatorColor: indicatorColor,
                  unselectedLabelColor: unselectLabelColor,
                  labelColor: indicatorColor,
                  labelStyle: textNormalCustom(
                      fontSize: 16, fontWeight: FontWeight.w400),
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text(
                        S.current.thanh_phan_tham_gia,
                      ),
                    ),
                    Tab(
                      child: Text(
                        S.current.thanh_phan_tham_gia,
                      ),
                    ),
                    Tab(
                      child: Text(
                        S.current.tai_lieu,
                      ),
                    ),
                    Tab(
                      child: Text(
                        S.current.thanh_phan_tham_gia,
                      ),
                    ),
                    Tab(
                      child: Text(
                        S.current.thanh_phan_tham_gia,
                      ),
                    ),
                    Tab(
                      child: Text(
                        S.current.thanh_phan_tham_gia,
                      ),
                    ),
                    Tab(
                      child: Text(
                        S.current.thanh_phan_tham_gia,
                      ),
                    ),
                  ],
                ),
                content: TabBarView(
                  controller: _controller,
                  children: const [
                    // CongTacChuanBiWidgetTablet(),
                    // MoiNguoiThamGiaWidgetTablet(),
                    // TaiLieuWidgetTablet(),
                    // PhatBieuWidgetTablet(),
                    // BieuQuyetWidgetTablet(),
                    // KetLuanHopWidgetTablet(),
                    // YKienCuocHopWidgetTablet(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemListKetThuc({
    required String icon,
    required String name,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColorApp,
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
      ),
    );
  }
}
