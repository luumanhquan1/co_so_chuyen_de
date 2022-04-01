import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/widget/chart_by_month_widget.dart';
import 'package:flutter/material.dart';

class ThongKeLichHopScreen extends StatefulWidget {
  final LichHopCubit cubit;

  const ThongKeLichHopScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  _ThongKeLichHopScreenState createState() => _ThongKeLichHopScreenState();
}

class _ThongKeLichHopScreenState extends State<ThongKeLichHopScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              S.current.so_lich_hop_theo_thoi_gian_trong_nam,
              style: textNormalCustom(
                color: textTitle,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          ChartByMonthWidget(
            cubit: widget.cubit,
          ),
          Container(
            width: double.maxFinite,
            height: 6,
            color: homeColor,
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              S.current.so_lich_hop_duoc_to_chuc_boi_cac_don_vi,
              style: textNormalCustom(
                color: textTitle,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
