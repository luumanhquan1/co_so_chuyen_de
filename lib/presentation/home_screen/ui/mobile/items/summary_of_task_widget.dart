import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/dialog_setting_widget.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/widgets/listview/rows_sum_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SummaryOfTaskWidget extends StatefulWidget {
  final HomeItemType homeItemType;
  const SummaryOfTaskWidget({Key? key,required this.homeItemType}) : super(key: key);

  @override
  State<SummaryOfTaskWidget> createState() => _SummaryOfTaskWidgetState();
}

class _SummaryOfTaskWidgetState extends State<SummaryOfTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundWidget(
      title: S.current.summary_of_tasks,
      onTapIcon: (){
        HomeProvider.of(context).homeCubit.showDialog(widget.homeItemType);
      },
      dialogSelect: DialogSettingWidget(
        type: widget.homeItemType,
      listSelectKey: [
        DialogData(
          title: S.current.summary_of_tasks,
          key: [
            SelectKey.TAT_CA,
            SelectKey.DON_VI,
          ],
        ),
        DialogData(
          title: S.current.misson,
          key: [
            SelectKey.CHO_XU_LY,
            SelectKey.DANG_XU_LY,
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
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          RowSumInfoWidget(data: [

          ],),

          const SizedBox(
            height: 20,
          ),
          const ContainerInfoWidget(
            status: 'Chờ phân xử lý',
            colorStatus: Color(0xff5A8DEE),
            title:
                'Rà soát, hoàn chỉnh kế hoạch đầu tư công trung hạn 2021-2025 cấp huyện',
            backGroundStatus: false,
            listData: [
              InfoData(key: 'Loại nhiệm vụ', value: 'Nhiệm vụ CP/VPCP'),
              InfoData(
                key: 'Hạn xử lý',
                value: '13/10/2021',
              ),
            ],
          ),
          const ContainerInfoWidget(
            status: 'Chờ phân xử lý',
            colorStatus: Color(0xff5A8DEE),
            title: 'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                      'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 2398473298'),
            ],
          ),
          const ContainerInfoWidget(
            status: 'Chờ phân xử lý',
            colorStatus: Color(0xff5A8DEE),
            title: 'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                key: 'Nơi gửi',
                value:
                    'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 2398473298',
              ),
            ],
          ),
          const ContainerInfoWidget(
            status: 'Chờ phân xử lý',
            colorStatus: Color(0xff5A8DEE),
            title: 'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                key: 'Nơi gửi',
                value:
                    'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 2398473298',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
