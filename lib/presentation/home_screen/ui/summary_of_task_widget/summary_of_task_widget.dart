import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SummaryOfTaskWidget extends StatelessWidget {
  const SummaryOfTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBackgroudWidget(
      title: S.current.summary_of_tasks,
      child: Column(
        children: [
          SizedBox(
            height: 88,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    width: 247,
                    height: 88,
                    decoration: const BoxDecoration(
                      color: Color(0xffF5F8FD),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_nhiem_vu.svg',
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tổng số nhiệm vụ",
                              style: textNormal(
                              const  Color(0xff3D5586),
                                16,
                              ),
                            ),
                          const  SizedBox(
                              height: 7,
                            ),
                            Text(
                              "18,109",
                              style: titleText(
                                color: Color(0xff5A8DEE),
                                fontSize: 26,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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
