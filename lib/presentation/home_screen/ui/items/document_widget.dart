import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';



class DocumentWidget extends StatefulWidget {
  final HomeItemType homeItemType;
  const DocumentWidget({Key? key,required this.homeItemType}) : super(key: key);

  @override
  State<DocumentWidget> createState() => _DocumentWidgetState();
}

class _DocumentWidgetState extends State<DocumentWidget> {
  @override
  Widget build(BuildContext context) {
    return      ContainerBackgroundWidget(
      title: S.current.document,
      onTapIcon: (){
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
              SelectKey.NAM_NAY
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
        children: const [
          ContainerInfoWidget(
            title:
            'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            status: 'Quá hạn',
            colorStatus: Color(0xffEA5455),
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                  'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 239847',),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ContainerInfoWidget(
            title:
            'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            status: 'Chờ tiếp nhận',
            colorStatus: Color(0xffEA5455),
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                  'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 23984',),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ContainerInfoWidget(
            title:
            'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            status: 'Hoàn thành',
            colorStatus: Color(0xff28C76F),
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                  'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 23738',),
            ],
          )
        ],
      ),
    );
  }
}
