import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:flutter/material.dart';

class YKienNguoiDan extends StatelessWidget {
  const YKienNguoiDan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBackgroudWidget(
      title: S.current.people_opinions,
      child: Column(
        children: const [
          ContainerInfoWidget(
            title: 'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            status: 'Quá hạn',
            colorStatus: Color(0xffEA5455),
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                key: 'Nơi gửi',
                value:
                    'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 239847',
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ContainerInfoWidget(
            title: 'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            status: 'Chờ tiếp nhận',
            colorStatus: Color(0xffEA5455),
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                      'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 9847 239',
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ContainerInfoWidget(
            title: 'Hội nghị lãnh đạo về việc cải cách chương trình đào tạo',
            status: 'Hoàn thành',
            colorStatus: Color(0xff28C76F),
            listData: [
              InfoData(key: 'Số/ký hiệu', value: 'VPCP-TTĐT'),
              InfoData(
                  key: 'Nơi gửi',
                  value:
                      'Ban ATGT Tiền Giang - tỉnh Tiền 4892 394 8372 98477',),
            ],
          )
        ],
      ),
    );
  }
}
