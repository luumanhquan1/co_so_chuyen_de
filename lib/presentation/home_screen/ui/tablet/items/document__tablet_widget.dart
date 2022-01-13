import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_provider.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/widgets/container_background_tablet_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/tablet/widgets/scroll_bar_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/enum_ext.dart';
import 'package:flutter/material.dart';

class DocumentTabletWidget extends StatefulWidget {
  final WidgetType homeItemType;
  const DocumentTabletWidget({Key? key, required this.homeItemType})
      : super(key: key);

  @override
  State<DocumentTabletWidget> createState() => _DocumentWidgetState();
}

class _DocumentWidgetState extends State<DocumentTabletWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundTabletWidget(
      maxHeight: 415,
      title: S.current.document,

      onTapIcon: () {
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: DialogSettingWidget(
        type: widget.homeItemType,
        listSelectKey: <DialogData>[
          DialogData(
            title: S.current.document,
            key: [
              SelectKey.CHO_XU_LY_VB_DEN,
              SelectKey.CHO_CHO_Y_KIEN_VB_DEN,
              SelectKey.CHO_TRINH_KY_VB_DI,
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
      child: Flexible(
        child: ScrollBarWidget(
          children: List.generate(FakeData.documentList.length, (index) {
            final data = FakeData.documentList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
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
      ),
    );
  }
}
