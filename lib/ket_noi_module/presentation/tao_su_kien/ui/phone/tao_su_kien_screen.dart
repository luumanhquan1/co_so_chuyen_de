import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/home_module/widgets/button/double_button_bottom.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/color.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/styles.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/tao_su_kien/bloc/tao_su_kien_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/app_bar/base_app_bar.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/custom_mutil_select/custom_mutil_select.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/explan_group/explan_group.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/text_field/text_field_style.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/text_field/text_field_style_png.dart';
import 'package:ccvc_mobile/utils/extensions/screen_device_extension.dart';
import 'package:ccvc_mobile/widgets/calendar/scroll_pick_date/ui/start_end_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaoSuKienKetNoi extends StatefulWidget {
  const TaoSuKienKetNoi({Key? key}) : super(key: key);

  @override
  _TaoSuKienKetNoiState createState() => _TaoSuKienKetNoiState();
}

class _TaoSuKienKetNoiState extends State<TaoSuKienKetNoi> {
  final TaoSuKienCubit cubit = TaoSuKienCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // cubit.getDetailChungKetNoi(id: widget.id);
    cubit.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return screenDevice(
      mobileScreen: Scaffold(
        appBar: BaseAppBar(
          title: S.current.tao_su_kien,
          leadingIcon: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: SvgPicture.asset(
              ImageAssets.icBacks,
            ),
          ),
          actions: const [],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpandGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldStyle(
                        urlIcon: ImageAssets.icEdit,
                        hintText: S.current.nhap_ten_chuong_trinh,
                      ),
                      spaceH5,
                      StreamBuilder<List<String>>(
                        stream: cubit.loaiBaiVietSubject,
                        builder: (context, snapshot) {
                          final data = snapshot.data ?? [];
                          return SelectOnlyExpand(
                            urlIcon: ImageAssets.ic_calender,
                            title: S.current.loai_hop,
                            value: data.first,
                            listSelect: data,
                          );
                        },
                      ),
                      spaceH5,
                      TextFieldStyle(
                        urlIcon: ImageAssets.icDoublePerson,
                        hintText: S.current.them_nguoi,
                      ),
                      spaceH5,
                      StartEndDateWidget(
                        icMargin: false,
                        onEndDateTimeChanged: (DateTime value) {},
                        onStartDateTimeChanged: (DateTime value) {},
                      ),
                      spaceH5,
                      TextFieldStyle(
                        urlIcon: ImageAssets.ic_location,
                        hintText: S.current.dia_diem,
                      ),
                      spaceH24,
                      Text(
                        S.current.thong_tin_lien_he,
                        style: textNormalCustom(
                          color: titleColor,
                          fontSize: 16.0,
                        ),
                      ),
                      spaceH5,
                      TextFieldStyle(
                        urlIcon: ImageAssets.icDocument,
                        hintText: S.current.so_dien_thoai,
                      ),
                      spaceH16,
                      TextFieldStyle(
                        urlIcon: ImageAssets.icViber,
                        hintText: S.current.id_viber,
                      ),
                      spaceH16,
                      TextFieldStylePNG(
                        urlIcon: ImageAssets.icGroup,
                        hintText: S.current.id_meeting,
                      ),
                      spaceH16,
                      TextFieldStylePNG(
                        urlIcon: ImageAssets.icZoom,
                        hintText: S.current.zoom,
                      ),
                      spaceH24,
                      TextFieldStyle(
                        urlIcon: ImageAssets.icDocument,
                        hintText: S.current.noi_dung,
                        maxLines: 4,
                      ),
                      spaceH24,
                      DoubleButtonBottom(
                        title1: S.current.huy,
                        title2: S.current.tao_su_kien,
                        onPressed1: () {},
                        onPressed2: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      tabletScreen: Container(),
    );
  }
}
