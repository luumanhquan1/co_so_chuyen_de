import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/home_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';

String appBarUrlIcon() {
  if (APP_BACKGROUND != null) {
    return _icBackGroundAppBar();
  }
  switch (APP_THEME) {
    case AppMode.MAC_DINH:
      return ImageAssets.appBarBackground;
    case AppMode.XANH:
      return ImageAssets.appBarBackgroundXanh;
    case AppMode.HONG:
      return ImageAssets.appBarBackgroundHong;
    case AppMode.VANG:
      return ImageAssets.appBarBackgroundVang;
  }
}

String headerUrlIcon() {
  if (APP_BACKGROUND != null) {
    return _headerUrlIconBackGround();
  }
  switch (APP_THEME) {
    case AppMode.MAC_DINH:
      return ImageAssets.headerBackground;
    case AppMode.XANH:
      return ImageAssets.headerBackgroudXanh;
    case AppMode.HONG:
      return ImageAssets.headerBackgroundHong;
    case AppMode.VANG:
      return ImageAssets.headerBackgroungVang;
  }
}

String _icBackGroundAppBar() {
  switch (APP_BACKGROUND) {
    case AppBackGround.XUAN:
      return ImageAssets.appBarBackGroundMuaXuan;
    case AppBackGround.HA:
      return ImageAssets.appBarBackGroundMuaHa;
    case AppBackGround.THU:
      return ImageAssets.appBarBackGroundMuaThu;

    case AppBackGround.DONG:
      return ImageAssets.appBarBackGroundMuaDong;
    case AppBackGround.TET_NGUYEN_DAN:
      return ImageAssets.appBarBackGroundTetNguyenDan;
    case AppBackGround.LE_TINH_NHAN:
      return ImageAssets.appBarBackGroundTinhNhan;
    case AppBackGround.NGAY_QUOC_TE_PHU_NU:
      return ImageAssets.appBarBackGroundQuocTePhuNu;
    case AppBackGround.GIO_TO_HUNG_VUONG:
      return ImageAssets.appBarBackGroundGioToHungVuong;
    case AppBackGround.NGAY_QUOC_TE_LAO_DONG:
      return ImageAssets.appBarBackGroundQuocTeLaoDong;
    case AppBackGround.NGAY_QUOC_TE_THIEU_NHI:
      return ImageAssets.appBarBackGroundQuocTeThieuNhi;
    case AppBackGround.NGAY_QUOC_KHANH:
      return ImageAssets.appBarBackGroundQuocKhanh;
    case AppBackGround.TET_TRUNG_THU:
      return ImageAssets.appBarBackGroundTrungThu;
    case AppBackGround.NGAY_PHU_NU_VIET_NAM:
      return ImageAssets.appBarBackGroundPhuNuVietNam;
    case AppBackGround.NGAY_LE_GIANG_SINH:
      return ImageAssets.appBarBackGroundGiangSinh;
    case AppBackGround.NGAY_HALLOWEEN:
      return ImageAssets.appBarBackGroundHalloween;
    case AppBackGround.NGAY_NHA_GIAO_VIET_NAM:
      return ImageAssets.appBarBackGroundNhaGiaoVietNam;
    default:
      {
        return '';
      }
  }
}

String _headerUrlIconBackGround() {
  switch (APP_BACKGROUND) {
    case AppBackGround.XUAN:
      return ImageAssets.headerBackgroungXuan;
    case AppBackGround.HA:
      return ImageAssets.headerBackgroungHa;
    case AppBackGround.THU:
      return ImageAssets.headerBackgroungThu;

    case AppBackGround.DONG:
      return ImageAssets.headerBackgroungDong;

    case AppBackGround.TET_NGUYEN_DAN:
      return ImageAssets.headerBackgroudTetNguyenDan;

    case AppBackGround.LE_TINH_NHAN:
      return ImageAssets.headerBackgroudTetLeTinhNhan;

    case AppBackGround.NGAY_QUOC_TE_PHU_NU:
      return ImageAssets.headerBackgroudQuocTePhuNu;

    case AppBackGround.GIO_TO_HUNG_VUONG:
      return ImageAssets.headerBackgroudGioToHungVuong;

    case AppBackGround.NGAY_QUOC_TE_LAO_DONG:
      return ImageAssets.headerBackgroudQuocTeLaoDong;

    case AppBackGround.NGAY_QUOC_TE_THIEU_NHI:
      return ImageAssets.headerBackgroudQuocTeThieuNhi;

    case AppBackGround.NGAY_QUOC_KHANH:
      return ImageAssets.headerBackgroudQuocKhanh;

    case AppBackGround.TET_TRUNG_THU:
      return ImageAssets.headerBackgroudTetTrungThu;

    case AppBackGround.NGAY_PHU_NU_VIET_NAM:
      return ImageAssets.headerBackgroudTetPhuNuVietNam;

    case AppBackGround.NGAY_LE_GIANG_SINH:
      return ImageAssets.headerBackgroudLeGiangSinh;

    case AppBackGround.NGAY_HALLOWEEN:
      return ImageAssets.headerBackgroudHalloween;

    case AppBackGround.NGAY_NHA_GIAO_VIET_NAM:
      return ImageAssets.headerBackgroudNhaGiaoVietNam;

    default:
      {
        return '';
      }
  }
}
