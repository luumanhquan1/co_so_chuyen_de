import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/color.dart';
import 'package:ccvc_mobile/ket_noi_module/config/resources/styles.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/danh_sach_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/detail_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/presentation/detail_chung_ket_noi/bloc/detail_cubit.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/ket_noi_module/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/ket_noi_module/widgets/app_bar/base_app_bar.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/utils/extensions/screen_device_extension.dart';
import 'package:ccvc_mobile/widgets/views/state_stream_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DetailChungKetNoi extends StatefulWidget {
  final String id;

  const DetailChungKetNoi({Key? key, required this.id}) : super(key: key);

  @override
  _DetailChungKetNoiState createState() => _DetailChungKetNoiState();
}

class _DetailChungKetNoiState extends State<DetailChungKetNoi> {
  final DetailCubit cubit = DetailCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getDetailChungKetNoi(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return screenDevice(
      mobileScreen: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('', S.current.something_went_wrong),
        stream: cubit.stateStream,
        child: Scaffold(
          appBar: BaseAppBar(
            title: S.current.chi_tiet_bai_viet,
            leadingIcon: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: SvgPicture.asset(
                ImageAssets.icBacks,
              ),
            ),
            actions: const [],
          ),
          body: StreamBuilder<DetailChungModel>(
            stream: cubit.subject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: Image.network(
                            subStringImage(
                              snapshot.data?.danhSachHinhAnh ?? '',
                            ).first,
                            fit: BoxFit.cover,
                            height: 186,
                            width: 343,
                            errorBuilder: (_, __, ___) {
                              return SvgPicture.asset(
                                ImageAssets.ic_no_image,
                                fit: BoxFit.cover,
                                height: 186,
                                width: 343,
                              );
                            },
                          ),
                        ),
                        spaceH12,
                        Text(
                          snapshot.data?.tenSuKien ?? '',
                          style: textListChung(
                            color: titleColor,
                            fontSize: 16,
                            textHeight: 1.7,
                          ),
                        ),
                        spaceH8,
                        Row(
                          children: [
                            SvgPicture.asset(ImageAssets.ic_calender),
                            spaceW12,
                            Text(
                              '${DateFormat('yyyy-MM-dd hh:mm:ss').parse(snapshot.data?.thoiGianBatDau ?? '').formatDdMMYYYY} ',
                              style: textNormal(color: dateColor),
                            )
                          ],
                        ),
                        spaceH8,
                        Row(
                          children: [
                            SvgPicture.asset(ImageAssets.ic_location),
                            spaceW12,
                            Text(
                              snapshot.data?.diaChi ?? '',
                              style: textNormal(color: dateColor),
                            )
                          ],
                        ),
                        spaceH18,
                        Text(
                          (snapshot.data?.noiDungSuKien ?? '').parseHtml(),
                          style: textDetailHDSD(
                            color: dateColor,
                            textHeight: 1.7,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
      tabletScreen: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('', S.current.something_went_wrong),
        stream: cubit.stateStream,
        child: Scaffold(
          backgroundColor: bgTabletColor,
          appBar: BaseAppBar(
            title: S.current.chi_tiet_bai_viet,
            leadingIcon: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: SvgPicture.asset(
                ImageAssets.icBacks,
              ),
            ),
            actions: const [],
          ),
          body: StreamBuilder<DetailChungModel>(
            stream: cubit.subject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 28,
                      left: 30,
                      right: 30,
                      bottom: 28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data?.tenSuKien ?? '',
                          style: textListChung(
                            color: titleColor,
                            textHeight: 1.7,
                            fontSize: 18,
                          ),
                        ),
                        spaceH17,
                        Row(
                          children: [
                            SvgPicture.asset(ImageAssets.ic_calender),
                            spaceW12,
                            Text(
                              '${DateFormat('yyyy-MM-dd hh:mm:ss').parse(snapshot.data?.thoiGianBatDau ?? '').formatDdMMYYYY} ',
                              style: textNormal(color: dateColor, fontSize: 16),
                            )
                          ],
                        ),
                        spaceH8,
                        Row(
                          children: [
                            SvgPicture.asset(ImageAssets.ic_location),
                            spaceW12,
                            Text(
                              snapshot.data?.diaChi ?? '',
                              style: textNormal(color: dateColor, fontSize: 16),
                            )
                          ],
                        ),
                        spaceH28,
                        Text(
                          subString(
                            (snapshot.data?.noiDungSuKien ?? '').parseHtml(),
                          ),
                          style: textDetailHDSD(
                            color: dateColor,
                            textHeight: 1.7,
                            fontSize: 16,
                          ),
                        ),
                        spaceH28,
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: Image.network(
                            subStringImage(
                              snapshot.data?.danhSachHinhAnh ?? '',
                            ).first,
                            fit: BoxFit.cover,
                            height: 500,
                            width: 964,
                            errorBuilder: (_, __, ___) {
                              return SvgPicture.asset(
                                ImageAssets.ic_no_image,
                                height: 500,
                                width: 964,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        spaceH18,
                        Text(
                          subStringLast(
                            (snapshot.data?.noiDungSuKien ?? '').parseHtml(),
                          ),
                          style: textDetailHDSD(
                            color: dateColor,
                            textHeight: 1.7,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
