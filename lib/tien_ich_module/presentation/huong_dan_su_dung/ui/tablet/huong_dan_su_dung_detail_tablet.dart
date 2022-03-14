import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_sach_title_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/bloc/huong_dan_su_dung_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/ui/widget/expand_only_huong_dan_su_dung.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/search/base_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HuongDanSuDungDetailTablet extends StatelessWidget {
  final String title;
  final String id;
  final HuongDanSuDungCubit cubit;

  const HuongDanSuDungDetailTablet({
    Key? key,
    required this.title,
    required this.id,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTabletColor,
      appBar: AppBarDefaultBack(
        '${S.current.huong_dan_su_dung} $title',
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0,right: 30.0,left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: BaseSearchBar(
                hintText: S.current.tim_kiem_cau_hoi,
                onChange: (value) {},
              ),
            ),
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImageAssets.imageHuongDanSuDungTablet),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                S.current.ban_co_the_tim_kiem_hdsd,
                style: textNormalCustom(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: textTitle,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
              child: Text(
                S.current.cac_cau_hoi_pho_bien,
                style: textNormalCustom(
                  fontSize: 18.0,
                  color: textTitle,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: StreamBuilder<List<DanhSachTitleHDSD>>(
                  stream: cubit.getDanhSachTitleHDSDStream,
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? [];
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ExpandOnlyHuongDanSuDung(
                          isTablet: true,
                          name: data[index].title ?? '',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data[index].topic}',
                                style: textNormalCustom(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: dateColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    S.current.ban_van_con_cau_hoi,
                    style: textNormalCustom(
                      fontSize: 16.0,
                      color: titleColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    S.current.neu_khong_the_tim_thay_cau_hoi,
                    style: textNormalCustom(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: dateColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      itemPhoneMailTablet(
                        ImageAssets.icCallHDSD,
                        '(0251).3847292',

                            () {},
                      ),
                      SizedBox(width: 70,),
                      itemPhoneMailTablet(
                        ImageAssets.icMailHDSD,
                        'www.thanhhoa.gov.vn',
                            () {},
                      ),
                    ],
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
Widget itemPhoneMailTablet(
    final String url,
    final String title,
    final Function onTap,
    ) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          url,
          width: 30,
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            title,
            style: textNormalCustom(
              fontSize: 12.0,
              color: titleColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
