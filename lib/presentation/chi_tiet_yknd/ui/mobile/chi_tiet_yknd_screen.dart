import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/bloc/chi_tiet_y_kien_nguoidan_cubit.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/widget/chi_tiet_header.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_yknd/ui/widget/thong_tin_nguoi_phan_anh.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/select_only_expands/expand_only_widget.dart';
import 'package:flutter/material.dart';

class ChiTietYKNDScreen extends StatefulWidget {
  const ChiTietYKNDScreen({Key? key}) : super(key: key);

  @override
  _ChiTietYKNDScreenState createState() => _ChiTietYKNDScreenState();
}

class _ChiTietYKNDScreenState extends State<ChiTietYKNDScreen> {
  ChiTietYKienNguoiDanCubit cubit = ChiTietYKienNguoiDanCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
        S.current.chi_tiet_yknd,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ChiTietYKNDHeader(
                cubit: cubit,
              ),
              ExpandOnlyWidget(
                initExpand: true,
                isShowIcon: false,
                header: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: cellColor,
                            border: Border.all(color: cellColorborder),
                        ),
                        child: Text(
                          S.current.thong_tin_nguoi_phan_anh,
                          style: textNormalCustom(
                            color: titleColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                child: ThongTinNguoiPhanAnh(cubit: cubit),
              )
            ],
          ),
        ),
      ),
    );
  }
}
