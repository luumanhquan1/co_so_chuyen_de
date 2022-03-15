import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/config/resources/color.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/bloc/huong_dan_su_dung_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/ui/tablet/huong_dan_su_dung_detail_tablet.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/ui/widget/item_huong_dan_su_dung.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/provider_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/search/base_search_bar.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/views/state_stream_layout.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class HuongDanSuDungTablet extends StatefulWidget {
  const HuongDanSuDungTablet({Key? key}) : super(key: key);

  @override
  _HuongDanSuDungTabletState createState() => _HuongDanSuDungTabletState();
}

class _HuongDanSuDungTabletState extends State<HuongDanSuDungTablet> {
  late HuongDanSuDungCubit cubit;

  @override
  void initState() {
    cubit = HuongDanSuDungCubit();
    cubit.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(S.current.huong_dan_su_dung),
      body: ProviderWidget<HuongDanSuDungCubit>(
        cubit: cubit,
        child: StateStreamLayout(
          textEmpty: S.current.khong_co_du_lieu,
          retry: () {},
          error: AppException(
            S.current.error,
            S.current.error,
          ),
          stream: cubit.stateStream,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.chung_toi_co_the_giup_gi,
                  style: textNormalCustom(
                    fontSize: 20.0,
                    color: titleColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text(
                    S.current.ban_co_the_tim_kiem_hdsd,
                    style: textNormalCustom(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: dateColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                  child: BaseSearchBar(
                    hintText: S.current.tim_kiem_cau_hoi,
                    onChange: (value) {},
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await cubit.loadData();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: StreamBuilder<List<TopicHDSD>>(
                        stream: cubit.getTopicHDSDStream,
                        builder: (context, snapshot) {
                          final data = snapshot.data ?? [];
                          if (data.isNotEmpty) {
                            return GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 4,
                              crossAxisSpacing: 28,
                              mainAxisSpacing: 28,
                              childAspectRatio: 1.25,
                              children: List.generate(data.length, (index) {
                                return ItemHuongDanSuDung(
                                  url: data[index].toIconTablet(),
                                  title: '${data[index].title}',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HuongDanSuDungDetailTablet(
                                          title: data[index].title ?? '',
                                          id: data[index].id ?? '',
                                          cubit: cubit,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                            );
                          } else {
                            return Center(
                              child: Text(S.current.no_data),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
