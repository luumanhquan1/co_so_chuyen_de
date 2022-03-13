import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/bloc/huong_dan_su_dung_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/ui/widget/item_huong_dan_su_dung.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
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
    cubit.getTopicHDSD();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDefaultBack(S.current.huong_dan_su_dung),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: StreamBuilder<List<TopicHDSD>>(
              stream: cubit.getTopicHDSDStream,
              builder: (context, snapshot) {
                final data = snapshot.data ?? [];
                return GridView.count(
                  // itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 2.3,
                  children: List.generate(data.length, (index) {
                    return ItemHuongDanSuDung(
                      url: data[index].typeIconHDSD.getIconHDSD(),
                      title: '${data[index].title}',
                    );
                    //   Text(
                    //   '${data[index].maTopic}',
                    //   style: TextStyle(
                    //     color: Colors.black
                    //   ),
                    // );
                  }),
                );
              }),
        ));
  }
}
