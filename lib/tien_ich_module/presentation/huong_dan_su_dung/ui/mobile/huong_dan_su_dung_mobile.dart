import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/bloc/huong_dan_su_dung_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/ui/mobile/huong_dan_su_dung_detail_mobile.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/ui/widget/item_huong_dan_su_dung.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/provider_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/search/base_search_bar.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/views/state_stream_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HuongDanSuDungMobile extends StatefulWidget {
  const HuongDanSuDungMobile({Key? key}) : super(key: key);

  @override
  _HuongDanSuDungMobileState createState() => _HuongDanSuDungMobileState();
}

class _HuongDanSuDungMobileState extends State<HuongDanSuDungMobile> {
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
      appBar: AppBarDefaultBack(
        S.current.huong_dan_su_dung,
      ),
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: StreamBuilder<List<TopicHDSD>>(
                        stream: cubit.getTopicHDSDStream,
                        builder: (context, snapshot) {
                          final data = snapshot.data ?? [];
                          if (data.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: GridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1.25,
                                children: List.generate(data.length, (index) {
                                  return ItemHuongDanSuDung(
                                    url: data[index].toIcon(),
                                    title: '${data[index].title}',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HuongDanSuDungDetailMobile(
                                            title: data[index].title ?? '',
                                            id: data[index].id ?? '',
                                            cubit: cubit,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
