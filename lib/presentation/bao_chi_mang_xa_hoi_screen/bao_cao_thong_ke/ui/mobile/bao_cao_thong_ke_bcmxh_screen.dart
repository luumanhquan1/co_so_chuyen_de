import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/home_module/widgets/show_buttom_sheet/show_bottom_sheet.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/bao_cao_thong_ke/bloc/bao_caoThong_ke_bcmxh_cubit.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/bao_cao_thong_ke/ui/widgets/baocao_chart_item.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/bao_cao_thong_ke/ui/widgets/bar_chart_tong_quan.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/widget/popup_choice_date.dart';
import 'package:ccvc_mobile/widgets/views/state_stream_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaoCaoThongKeBCMXHScreen extends StatefulWidget {
  final int topic;

  const BaoCaoThongKeBCMXHScreen({Key? key, required this.topic})
      : super(key: key);

  @override
  State<BaoCaoThongKeBCMXHScreen> createState() =>
      _BaoCaoThongKeBCMXHScreenState();
}

class _BaoCaoThongKeBCMXHScreenState extends State<BaoCaoThongKeBCMXHScreen> {
  BaoCaoThongKeBCMXHCubit baoCaoThongKeBCMXHCubit = BaoCaoThongKeBCMXHCubit();

  @override
  void initState() {
    super.initState();
    baoCaoThongKeBCMXHCubit.getTongQuanBaoCao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StateStreamLayout(
          textEmpty: S.current.khong_co_du_lieu,
          retry: () {},
          error: AppException('1', ''),
          stream: baoCaoThongKeBCMXHCubit.stateStream,
          child: SingleChildScrollView(
            child: Column(
              children: [
                  GroupChartItemWidget(
                   title: 'hahahaha',
                   child: BarChartTongQuanWidget(
                     cubit: baoCaoThongKeBCMXHCubit,
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
