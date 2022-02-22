import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/bloc/chi_tiet_lich_hop_cubit.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/widgets/button/double_button_bottom.dart';
import 'package:ccvc_mobile/widgets/dropdown/custom_drop_down.dart';
import 'package:flutter/material.dart';

class TaoBocBangWidget extends StatefulWidget {
  const TaoBocBangWidget({Key? key}) : super(key: key);

  @override
  _TaoBocBangWidgetState createState() => _TaoBocBangWidgetState();
}

class _TaoBocBangWidgetState extends State<TaoBocBangWidget> {
  DetailMeetCalenderCubit cubit = DetailMeetCalenderCubit();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (APP_DEVICE == DeviceType.MOBILE)
            Text(
              S.current.Chon_can_bo_boc_bang,
              style: textNormalCustom(color: titleItemEdit),
            )
          else
            const SizedBox(),
          const SizedBox(
            height: 8,
          ),
          CustomDropDown(
            hint: Text(
              S.current.Chon_don_vi_su_dung,
              style: textNormalCustom(color: titleItemEdit),
            ),
            items: cubit.fakeDataDropdown,
            onSelectItem: (value) {},
          ),
          const SizedBox(
            height: 36,
          ),
          Padding(
            padding: APP_DEVICE == DeviceType.MOBILE
                ? const EdgeInsets.all(0)
                : const EdgeInsets.symmetric(horizontal: 100),
            child: DoubleButtonBottom(
              title1: S.current.dong,
              title2: S.current.xac_nhan,
              onPressed1: () {
                Navigator.pop(context);
              },
              onPressed2: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}