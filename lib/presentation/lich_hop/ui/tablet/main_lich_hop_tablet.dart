import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/mobile/lich_hop_extension.dart';
import 'package:ccvc_mobile/presentation/lich_hop/ui/tablet/widget/wisget_choose_day_week_month.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainLichHopTabLet extends StatefulWidget {
  const MainLichHopTabLet({Key? key}) : super(key: key);

  @override
  _MainLichHopTabLetState createState() => _MainLichHopTabLetState();
}

class _MainLichHopTabLetState extends State<MainLichHopTabLet> {
  LichHopCubit cubit = LichHopCubit();

  @override
  void initState() {
    super.initState();
    cubit.chooseTypeList(Type_Choose_Option_List.DANG_LIST);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: S.current.lich_hop_cua_toi,
      leadingIcon: IconButton(
        onPressed: (){

        },
        icon: SvgPicture.asset(
          ImageAssets.icMenuLichHopTablet,
        ),
      ),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WidgetChooseDayWeekMonth(
                createMeeting: () {},
                onTapDay: () {},
                onTapWeek: () {},
                onTapMonth: () {})
          ],
        ),
      ),
    );
  }
}
