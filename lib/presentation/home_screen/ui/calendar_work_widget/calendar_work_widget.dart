import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:flutter/material.dart';


class CalendarWorkWidget extends StatelessWidget {
  const CalendarWorkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBackgroudWidget(
      title: S.current.calendar_work,
      child: Column(
        children: const [
          ContainerInfoWidget(
            status: 'Chờ xác nhận',
            colorStatus: Color(0xff28C76F),
            backGroundStatus: true,
            title:
            'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                  'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 2398473298'),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ContainerInfoWidget(
            title:
            'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                  'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 2398473298'),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ContainerInfoWidget(
            title:
            'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                  'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 2398473298'),
            ],
          )
        ],
      ),
    );
  }
}
