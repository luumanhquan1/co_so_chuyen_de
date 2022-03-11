import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const baseImg = 'lib/tien_ich_module/assets/images';

class ImageAssets {
  ///Svg path
  static const String icChuyenGiongNoiThanhVanBan = '$baseImg/ic_chuyen_giong_noi_thanh_van_ban.svg';
  static const String icChuyenVanBanThanhGiongNoi = '$baseImg/ic_chuyen_van_ban_thanh_giong_noi.svg';
  static const String icDanhBaDienTu = '$baseImg/ic_danh_ba_dien_tu.svg';
  static const String icDanhSachCongViec = '$baseImg/ic_danh_sach_cong_viec.svg';
  static const String icHuongDanSuDung = '$baseImg/ic_huong_dan_su_dung.svg';
  static const String icLichAmDuong = '$baseImg/ic_lich_am_duong.svg';
  static const String icMangXaHoi = '$baseImg/ic_mang_xa_hoi_noi_bo.svg';
  static const String icPhienDichTuDong = '$baseImg/ic_phien_dich_tu_dong.svg';
  static const String icTraCuuVanBanPhapLuat = '$baseImg/ic_tra_cuu_van_ban_phap_luat.svg';
  static const String image_tien_ich = '$baseImg/image_tien_ich.svg';
  static const String image_tien_ichPng = '$baseImg/image_tien_ich.png';
  static const String imageTienIchTablet = '$baseImg/image_tien_ich_tablet.png';


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
