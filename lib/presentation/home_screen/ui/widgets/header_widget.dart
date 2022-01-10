

import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/domain/model/home/tinh_huong_khan_cap_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';

import 'package:ccvc_mobile/presentation/home_screen/ui/mobile/home_screen.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/clock_widget.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/mequee_widget.dart';
import 'package:ccvc_mobile/presentation/webview/web_view_screen.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      color: AppTheme.getInstance().backGroundColor(),
      child: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -120),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.headerBackground),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            height: 166,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 16, right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff6566E9).withOpacity(0.1),
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: borderColor)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '${S.current.hello}, ',
                              style: textNormal(
                                AppTheme.getInstance().titleColor(),
                                16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Cao Tiến Dũng',
                                  style: titleText(
                                    color: AppTheme.getInstance().titleColor(),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Chủ tịch UBND tỉnh',
                            style: textNormal(
                              subTitle,
                              14,
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ClockWidget(),
                            RichText(
                              text: TextSpan(
                                text: 'AQI: ',
                                style: titleText(color: AqiColor, fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "49 (Tốt)",
                                    style: titleText(
                                      color: Colors.green,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Thứ 3, ngày 27 tháng 04 năm 2021",
                              style: textNormalCustom(
                                  color: AppTheme.getInstance().titleColor(),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "16 tháng 3 (Đ), Tân Sửu",
                              style: textNormal(AqiColor.withOpacity(0.8), 14),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: processingColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Ngày hoàng đạo",
                                  style:
                                      textNormal(AqiColor.withOpacity(0.8), 14),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 65,
              color: Colors.transparent,
              margin: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Image.asset(
                   ImageAssets.gifKhanCap,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: StreamBuilder<List<TinhHuongKhanCapModel>>(
                      stream:
                          HomeProvider.of(context).homeCubit.tinhHuongKhanCap,
                      builder: (context, snapshot) {
                        final data = snapshot.data ?? [];
                        if (data.isNotEmpty) {
                          return MequeeWidget(
                            spacing: 16,
                            child: List.generate(data.length, (index) {
                              final result = data[index];
                              return GestureDetector(
                                onTap: () {
                                  if (result.isLink) {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            WebViewScreen(
                                          title: '',
                                          url: result.linkOrContent ?? '',
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        color: specialPriceColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      result.title,
                                      style: textNormalCustom(
                                        color: specialPriceColor,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          );
                        }
                        return Container(
                          color: Colors.transparent,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
