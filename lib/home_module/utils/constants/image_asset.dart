import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const baseImg = 'lib/home_module/assets/images';

class ImageAssets {
  ///Svg path
  static const String bgAppBarTablet = '$baseImg/bg_app_bar.png';
  static const String icTongSoNhiemVu = '$baseImg/ic_tong_so_nhiem_vu.svg';
  static const String icHoanThanhNhiemVu =
      '$baseImg/ic_hoan_thanh-nhiem_vu.svg';
  static const String icNhiemVuDangThucHien =
      '$baseImg/ic_nhiem_vu_dang-thuc_hien.svg';
  static const String icHoanThanhQuaHan =
      '$baseImg/ic_hoan_thanh_qua_han.svg'; //
  static const String icDangThucHienTrongHan =
      '$baseImg/ic_dang_thuc_hien_trong_han.svg'; //
  static const String icDangThucHienQuaHan =
      '$baseImg/ic_dang_thuc_hien_qua_han.svg'; //

  static const String icCalendarUnFocus = '$baseImg/ic_calendar.svg';

  static const String icPlus = '$baseImg/ic_cong.svg';
  static const String icClose = '$baseImg/ic_close.svg';

  static const String icMore = '$baseImg/ic_more.svg';
  static const String icEdit = '$baseImg/ic_edit.svg';
  static const String icStarUnfocus = '$baseImg/ic_start_unfocus.svg';
  static const String icStarFocus = '$baseImg/ic_start_focus.svg';
  static const String icTag = '$baseImg/ic_tag.svg';
  static const String icAddress = '$baseImg/ic_addres.svg';
  static const String icSoKyHieu = '$baseImg/ic_so_ky_hieu.svg';
  static const String icTime = '$baseImg/ic_time.svg';
  static const String icPeople = '$baseImg/ic_people.svg';
  static const String icCalendar = '$baseImg/ic_calendar.svg';
  static const String icWork = '$baseImg/ic_work.svg';


  static const String icThoiTiet = '$baseImg/ic_thoi_tiet.png';

  static const String icDeleteLichHop = '$baseImg/ic_delete_lich_hop.svg';

  static const String icSearchWhite = '$baseImg/ic_search_white.svg';
  static const String icThongBao = '$baseImg/ic_thong_bao.svg';

  static const String anhDaiDienMacDinh = '$baseImg/anh_dai_dien.png';

  static const String icEditBlue = '$baseImg/ic_edit_blue.svg';

  static const String gifKhanCap = '$baseImg/gif_khan_cap.gif';
  static const String imgHeaderTablet = '$baseImg/ic_header_tablet.png';
  static const String headerBackground = '$baseImg/header_background.png';
  static const String appBarBackground = '$baseImg/app_bar_background.png';

  static SvgPicture svgAssets(
    String name, {
    Color? color,
    double? width,
    double? height,
    BoxFit? fit,
    BlendMode? blendMode,
  }) {
    final size = _svgImageSize[name];
    var w = width;
    var h = height;
    if (size != null) {
      w = width ?? size[0];
      h = height ?? size[1];
    }
    return SvgPicture.asset(
      name,
      colorBlendMode: blendMode ?? BlendMode.srcIn,
      color: color,
      width: w,
      height: h,
      fit: fit ?? BoxFit.none,
    );
  }

  static const Map<String, List<double>> _svgImageSize = {};
}
