import 'package:ccvc_mobile/config/app_config.dart';
import 'package:ccvc_mobile/home_module/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';

String appBarUrlIcon() {
  if (APP_BACKGROUND != null) {
    return _icBackGroundAppBar();
  }
  switch (APP_THEME) {
    case AppMode.MAC_DINH:
      return ImageAssets.bgAppBarTablet;
    case AppMode.XANH:
      return ImageAssets.appBarBackgroundXanhTablet;
    case AppMode.HONG:
      return ImageAssets.appBarBackgroundHongTablet;
    case AppMode.VANG:
      return ImageAssets.appBarBackgroundVangTablet;
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
      return ImageAssets.appBarBackGroundMuaXuanTablet;
    case AppBackGround.HA:
      return ImageAssets.appBarBackGroundMuaHaTablet;
    case AppBackGround.THU:
      return ImageAssets.appBarBackGroundMuaThuTablet;

    case AppBackGround.DONG:
      return ImageAssets.appBarBackGroundMuaDongTablet;
    case AppBackGround.TET_NGUYEN_DAN:
      return ImageAssets.appBarBackGroundTetNguyenDanTablet;
    case AppBackGround.LE_TINH_NHAN:
      return ImageAssets.appBarBackGroundTinhNhanTablet;
    case AppBackGround.NGAY_QUOC_TE_PHU_NU:
      return ImageAssets.appBarBackGroundQuocTePhuNuTablet;
    case AppBackGround.GIO_TO_HUNG_VUONG:
      return ImageAssets.appBarBackGroundGioToHungVuongTablet;
    case AppBackGround.NGAY_QUOC_TE_LAO_DONG:
      return ImageAssets.appBarBackGroundQuocTeLaoDongTablet;
    case AppBackGround.NGAY_QUOC_TE_THIEU_NHI:
      return ImageAssets.appBarBackGroundQuocTeThieuNhiTablet;
    case AppBackGround.NGAY_QUOC_KHANH:
      return ImageAssets.appBarBackGroundQuocKhanhTablet;
    case AppBackGround.TET_TRUNG_THU:
      return ImageAssets.appBarBackGroundTrungThuTablet;
    case AppBackGround.NGAY_PHU_NU_VIET_NAM:
      return ImageAssets.appBarBackGroundPhuNuVietNamTablet;
    case AppBackGround.NGAY_LE_GIANG_SINH:
      return ImageAssets.appBarBackGroundGiangSinhTablet;
    case AppBackGround.NGAY_HALLOWEEN:
      return ImageAssets.appBarBackGroundHalloweenTablet;
    case AppBackGround.NGAY_NHA_GIAO_VIET_NAM:
      return ImageAssets.appBarBackGroundNhaGiaoVietNamTablet;
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
