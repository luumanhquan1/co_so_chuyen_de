import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/color.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_sach_title_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/bloc/huong_dan_su_dung_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/huong_dan_su_dung/ui/widget/expand_only_huong_dan_su_dung.dart';
import 'package:ccvc_mobile/tien_ich_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/search/base_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HuongDanSuDungDetailMobile extends StatelessWidget {
  final String title;
  final String id;
  final HuongDanSuDungCubit cubit;

  const HuongDanSuDungDetailMobile({
    Key? key,
    required this.title,
    required this.id,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
        '${S.current.huong_dan_su_dung} $title',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: BaseSearchBar(
                hintText: S.current.tim_kiem_cau_hoi,
                onChange: (value) {},
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
                          name: data[index].title ?? '',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data[index].topic}',
                                style: textNormalCustom(
                                  fontSize: 14.0,
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
              mainAxisSize: MainAxisSize.min,
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
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: dateColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      itemPhoneMail(
                        ImageAssets.icCallHDSD,
                        '(0251).3847292',
                        S.current.chung_toi_luon_san_sang_giup_do,
                        () {},
                      ),
                      itemPhoneMail(
                        ImageAssets.icMailHDSD,
                        'www.thanhhoa.gov.vn',
                        S.current.cach_tot_nhat_de_nhan_cau_tra_loi_nhanh,
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

Widget itemPhoneMail(
  final String url,
  final String title,
  final String content,
  final Function onTap,
) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      height: 152,
      width: 162,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: backgroundColorApp,
        border: Border.all(color: borderColor.withOpacity(0.5)),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: shadowContainerColor.withOpacity(0.05),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            url,
            width: 43,
            height: 43,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              title,
              style: textNormalCustom(
                fontSize: 12.0,
                color: titleColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              content,
              style: textNormalCustom(
                fontSize: 12.0,
                color: dateColor,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ),
  );
}
