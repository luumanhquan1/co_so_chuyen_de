import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/config/themes/app_theme.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widgets/container_backgroud_widget.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PressSocialNetWork extends StatelessWidget {
  const PressSocialNetWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBackgroudWidget(
      title: S.current.press_socialNetWord,
      child: Column(
        children: [
          tagWidget(),
          SizedBox(
            height: 16,
          ),
          baoChiWidget(),
          SizedBox(
            height: 16,
          ),
          baoChiWidget(),
          SizedBox(
            height: 16,
          ),
          baoChiWidget(),
          SizedBox(
            height: 16,
          ),
          baoChiWidget()
        ],
      ),
    );
  }

  Widget baoChiWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffDBDFEF).withOpacity(0.5),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff6566E9).withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 90,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(
                    'https://kinhdoanhvaphattrien.vn/data/uploads/2021/12/IMG_9848.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Xem xét đề xuất tạm dừng bay TP HCM - Phú Quốc qehqwioehiq w1he234',
                  style: textNormal(
                    const Color(0xff3D5586),
                    14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    SvgPicture.asset(ImageAssets.icCalendarUnFocus),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      '5/11/2021  9:10:03 PM',
                      style:textNormal(
                        const  Color(0xff667793),
                        14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'dienbien.gov.vn',
                    style:textNormal(
                      const  Color(0xff7966FF),
                      14,
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tagWidget() {
    return SizedBox(
      height: 26,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: const BoxDecoration(
                  color: Color(0xff7966FF),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Text(
                "#Covid-19",
                style: textNormal(
                  AppTheme.getInstance().dfBtnTxtColor(),
                  12,
                ),
              ),
            );
          }),
    );
  }
}
