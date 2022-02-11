import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/tao_lich_hop_screen/widgets/title_child_widget.dart';
import 'package:ccvc_mobile/presentation/them_don_vi_phoi_hop_khac/them_don_vi_phoi_hop_khac.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/button/solid_button.dart';
import 'package:ccvc_mobile/widgets/show_buttom_sheet/show_bottom_sheet.dart';
import 'package:ccvc_mobile/widgets/them_don_vi_phoi_hop_khac/them_don_vi_phoi_hop_khac_widget.dart';
import 'package:flutter/material.dart';

class DonViPhoiHopKhacWidget extends StatelessWidget {
  const DonViPhoiHopKhacWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitleChildWidget(
      title: S.current.don_vi_phoi_hop_khac,
      sizeTitle: 14,
      child: ThemDonViPhoiHopKhacWidget(),
    );
  }
}
