import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/block/y_kien_nguoidan_cubit.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/block/y_kien_nguoidan_state.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/mobile/widgets/y_kien_nguoi_dan_menu.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/widget/bao_cao_thong_ke/ui/tablet/bao_cao_thong_ke_tablet.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/widget/bao_cao_thong_ke/ui/tablet/thong_tin_chung_tablet.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:ccvc_mobile/widgets/drawer/drawer_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class YKienNguoiDanTablet extends StatefulWidget {
  const YKienNguoiDanTablet({Key? key}) : super(key: key);

  @override
  _YKienNguoiDanTabletState createState() => _YKienNguoiDanTabletState();
}

class _YKienNguoiDanTabletState extends State<YKienNguoiDanTablet> {
  YKienNguoiDanCubitt cubit = YKienNguoiDanCubitt();
  late String title;
  late Widget actionWidget;

  @override
  void initState() {
    super.initState();
    title = S.current.thong_tin_chung;
    cubit.initTimeRange();
    cubit.callApi();
    cubit.emit(ThongTinChung());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YKienNguoiDanCubitt, YKienNguoiDanState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is ThongTinChung) {
          title = S.current.thong_tin_chung;
          actionWidget=  IconButton(
            onPressed: () {
              DrawerSlide.navigatorSlide(
                context: context,
                screen: YKienNguoiDanMenu(
                  cubit: cubit,
                ),
              );
            },
            icon: SvgPicture.asset(ImageAssets.icMenuCalender),
          );
        } else {
          actionWidget=actionAppbarBaoCao();
          title = S.current.bao_cao_thong_ke;
        }
        return Scaffold(
          appBar: BaseAppBar(
            title: title,
            leadingIcon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                ImageAssets.icBack,
              ),
            ),
            actions: [
              actionWidget
            ],
          ),
          body: BlocBuilder<YKienNguoiDanCubitt, YKienNguoiDanState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is ThongTinChung) {
                return const ThongTinChungYKNDTablet();
              } else {
                return const BaoCaoThongKeTablet();
              }
            },
          ),
        );
      },
    );
  }

  Widget actionAppbarBaoCao() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(ImageAssets.ic_search_calendar),
        ),
        GestureDetector(
          onTap: () {
            DrawerSlide.navigatorSlide(
              context: context,
              screen: YKienNguoiDanMenu(
                cubit: cubit,
              ),
            );
          },
          child: SvgPicture.asset(ImageAssets.icMenuCalender),
        ),
        const SizedBox(width: 16,),

      ],
    );
  }
}
