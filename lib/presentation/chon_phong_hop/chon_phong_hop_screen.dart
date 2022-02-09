import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chon_phong_hop/bloc/chon_phong_hoc_cubit.dart';
import 'package:ccvc_mobile/presentation/chon_phong_hop/widgets/loai_phong_hop_widget.dart';
import 'package:ccvc_mobile/presentation/chon_phong_hop/widgets/yeu_cau_them_thiet_bi_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/button/solid_button.dart';
import 'package:ccvc_mobile/widgets/show_buttom_sheet/show_bottom_sheet.dart';
import 'package:ccvc_mobile/widgets/thanh_phan_tham_gia/them_can_bo/widgets/select_don_vi.dart';
import 'package:flutter/material.dart';

class ChonPhongHopScreen extends StatefulWidget {
  const ChonPhongHopScreen({Key? key}) : super(key: key);

  @override
  _ChonPhongHopWidgetState createState() => _ChonPhongHopWidgetState();
}

class _ChonPhongHopWidgetState extends State<ChonPhongHopScreen> {
  final ChonPhongHopCubit _cubit = ChonPhongHopCubit();
  @override
  Widget build(BuildContext context) {
    return SolidButton(
      onTap: () {
        showBottomSheet();
      },
      text: S.current.chon_phong_hop,
      urlIcon: ImageAssets.icChonPhongHop,
    );
  }

  void showBottomSheet() {
    showBottomSheetCustom(
      context,
      child: _ChonPhongHopScreen(
        chonPhongHopCubit: _cubit,
      ),
      title: S.current.chon_phong_hop,
    );
  }
}

class _ChonPhongHopScreen extends StatefulWidget {
  final ChonPhongHopCubit chonPhongHopCubit;
  const _ChonPhongHopScreen({Key? key, required this.chonPhongHopCubit})
      : super(key: key);
  @override
  __ChonPhongHopScreenState createState() => __ChonPhongHopScreenState();
}

class __ChonPhongHopScreenState extends State<_ChonPhongHopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoaiPhongHopWidget(),
            spaceH25,
            SelectDonVi(
              onChange: (value) {},
            ),
            spaceH20,
            YeuCauThemThietBiWidget(
              chonPhongHopCubit: widget.chonPhongHopCubit,
            )
          ],
        ),
      ),
    );
  }
}
