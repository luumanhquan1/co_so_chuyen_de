import 'dart:ui';

import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tat_ca_chu_de/bao_cao_thong_ke.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tat_ca_chu_de/list_chu_de.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tat_ca_chu_de_screen/bloc/chu_de_cubit.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tat_ca_chu_de_screen/ui/mobile/hot_new.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tat_ca_chu_de_screen/ui/mobile/item_infomation.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tat_ca_chu_de_screen/ui/mobile/item_list_new.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tat_ca_chu_de_screen/ui/mobile/item_table_topic.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/widgets/calendar/table_calendar/table_calendar_widget.dart';
import 'package:ccvc_mobile/widgets/views/state_stream_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class TatCaChuDeScreen extends StatefulWidget {
  const TatCaChuDeScreen({Key? key}) : super(key: key);

  @override
  State<TatCaChuDeScreen> createState() => _TatCaChuDeScreenState();
}

class _TatCaChuDeScreenState extends State<TatCaChuDeScreen> {
  ScrollController _scrollController = ScrollController();
  ChuDeCubit chuDeCubit = ChuDeCubit();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {}
    });
    chuDeCubit.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            StateStreamLayout(
              textEmpty: S.current.khong_co_du_lieu,
              retry: () {},
              error: AppException('1', ''),
              stream: chuDeCubit.stateStream,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 130,
                      ),
                      StreamBuilder<List<ItemInfomationModel>>(
                        stream: chuDeCubit.streamDashBoard,
                        builder: (context, snapshot) {
                          final data = snapshot.data ?? [];
                          return GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            childAspectRatio: 2.3,
                            children: data
                                .map(
                                  (e) => ItemInfomation(
                                    infomationModel: e,
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                      StreamBuilder<TuongTacThongKeResponseModel>(
                        stream: chuDeCubit.dataBaoCaoThongKe,
                        builder: (context, snapshot) {
                          final data = snapshot.data ??
                              TuongTacThongKeResponseModel(
                                danhSachTuongtacThongKe: [],
                              );
                          return SizedBox(
                            height: 240,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: data.danhSachTuongtacThongKe.length,
                              itemBuilder: (context, index) {
                                return ItemTableTopic(
                                  chuDeCubit.listTitle[index],
                                  '',
                                  data
                                      .danhSachTuongtacThongKe[index]
                                      .dataTuongTacThongKeModel
                                      .interactionStatistic,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StreamBuilder<List<ChuDeModel>>(
                        stream: chuDeCubit.listYKienNguoiDan,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final listChuDe = snapshot.data ?? [];
                            final ChuDeModel hotNew =
                                listChuDe.removeAt(0);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.current.tin_noi_bat,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: titleColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                HotNews(
                                  hotNew.avartar ?? '',
                                  hotNew.title ?? '',
                                  DateTime.parse(
                                    hotNew.publishedTime ?? '',
                                  ).formatApiSS,
                                  hotNew.contents ?? '',
                                  hotNew.url??'',
                                ),
                                const SizedBox(
                                  height: 16,
                                  child: Divider(
                                    color: lineColor,
                                    height: 1,
                                  ),
                                ),
                                ListView.builder(
                                  // controller: _scrollController,
                                  itemCount: listChuDe.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ItemListNews(
                                          listChuDe[index].avartar ?? '',
                                          listChuDe[index].title ?? '',
                                          DateTime.parse(
                                            listChuDe[index].publishedTime ??
                                                '',
                                          ).formatApiSS,
                                          listChuDe[index].url??'',
                                        ),
                                        const SizedBox(
                                          height: 16,
                                          child: Divider(
                                            color: lineColor,
                                            height: 1,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TableCalendarWidget(
              onChange:
                  (DateTime startDate, DateTime endDate, DateTime selectDay) {
                chuDeCubit.startDate = startDate.formatApiStartDay;
                chuDeCubit.endDate = endDate.formatApiEndDay;
                chuDeCubit.startDateDashBoard = startDate.formatApiStartDay;
                chuDeCubit.endDateDashBoard = endDate.formatApiEndDay;
                chuDeCubit.getDashboard(
                  chuDeCubit.startDateDashBoard,
                  chuDeCubit.endDateDashBoard,
                );
              },
              onSearch: (value) {
                chuDeCubit.getListTatCaCuDe(
                  chuDeCubit.startDate,
                  chuDeCubit.endDate,
                );
              },
              onChangeRange:
                  (DateTime? start, DateTime? end, DateTime? focusedDay) {
                chuDeCubit.startDateDashBoard = start?.formatApiSS ?? '';
                chuDeCubit.endDateDashBoard = end?.formatApiSS ?? '';
                chuDeCubit.getDashboard(
                  chuDeCubit.startDateDashBoard,
                  chuDeCubit.endDateDashBoard,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
