import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:flutter/material.dart';

class PeopleOpinions extends StatefulWidget {
  final HomeItemType homeItemType;
  const PeopleOpinions({Key? key,required this.homeItemType}) : super(key: key);

  @override
  State<PeopleOpinions> createState() => _PeopleOpinionsState();
}

class _PeopleOpinionsState extends State<PeopleOpinions> {
  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundWidget(
      title: S.current.people_opinions,
      onTapIcon: (){
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      spacingTitle: 0,
      dialogSelect: DialogSettingWidget(
        type: widget.homeItemType,
        listSelectKey: [
          DialogData(
            title: S.current.people_opinions,
            key: [
            SelectKey.CHO_TIEP_NHAN,
            SelectKey.CHO_XU_LY
            ],
          ),
          DialogData(
            title: S.current.time,
            key: [
              SelectKey.HOM_NAY,
              SelectKey.TUAN_NAY,
              SelectKey.THANG_NAY,
              SelectKey.NAM_NAY
            ],
          )
        ],
      ),
      child: Column(
        children: List.generate(FakeData.documentList.length, (index) {
          final data = FakeData.documentList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ContainerInfoWidget(
              title: data.title,
              status: data.documentStatus.getText(),
              colorStatus: data.documentStatus.getColor(),
              listData: [
                InfoData(
                  urlIcon: ImageAssets.icSoKyHieu,
                  key: S.current.so_ky_hieu,
                  value: data.kyHieu,
                ),
                InfoData(
                  urlIcon: ImageAssets.icAddress,
                  key: S.current.noi_gui,
                  value: data.noiGui,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
