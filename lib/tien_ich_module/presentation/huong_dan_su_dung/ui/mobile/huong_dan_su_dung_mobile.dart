import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/bloc/huong_dan_su_dung_cubit.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
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
    cubit=HuongDanSuDungCubit();
    cubit.getTopicHDSD();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
          S.current.huong_dan_su_dung
      ),
      body: Container(),
    );
  }
}
