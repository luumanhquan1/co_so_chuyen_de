import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';

extension AppBackGroundEx on AppBackGround {
  String getText() {
    switch (this) {
      case AppBackGround.XUAN:
        return S.current.xuan;
      case AppBackGround.HA:
        return S.current.ha;
      case AppBackGround.THU:
        return S.current.thu;
      case AppBackGround.DONG:
        return S.current.dong_mua;
      case AppBackGround.TET_NGUYEN_DAN:
        return S.current.tet_nguyen_dam;
      case AppBackGround.LE_TINH_NHAN:
        return S.current.le_tinh_nhan;
      case AppBackGround.NGAY_QUOC_TE_PHU_NU:
        return S.current.ngay_quoc_te_phu_nu;
      case AppBackGround.GIO_TO_HUNG_VUONG:
        return S.current.gio_to_hung_vuong;
      case AppBackGround.NGAY_QUOC_TE_LAO_DONG:
        return S.current.ngay_quoc_te_lao_dong;
      case AppBackGround.NGAY_QUOC_TE_THIEU_NHI:
        return S.current.ngay_quoc_te_thieu_nhi;
      case AppBackGround.NGAY_QUOC_KHANH:
        return S.current.ngay_quoc_khanh;
      case AppBackGround.TET_TRUNG_THU:
        return S.current.tet_trung_thu;
      case AppBackGround.NGAY_PHU_NU_VIET_NAM:
        return S.current.ngay_phu_nu_viet_nam;
      case AppBackGround.NGAY_LE_GIANG_SINH:
        return S.current.ngay_le_giang_sinh;
      case AppBackGround.NGAY_HALLOWEEN:
        return S.current.ngay_halloween;
      case AppBackGround.NGAY_NHA_GIAO_VIET_NAM:
        return S.current.ngay_nha_giao_viet_nam;
    }
  }

  String getIcon() {
    switch (this) {
      case AppBackGround.XUAN:
        return ImageAssets.icBackGroundXuan;
      case AppBackGround.HA:
        return ImageAssets.icBackGroundHa;
      case AppBackGround.THU:
        return ImageAssets.icBackGroundThu;
      case AppBackGround.DONG:
        return ImageAssets.icBackGroundDong;
      case AppBackGround.TET_NGUYEN_DAN:
        return ImageAssets.bgTetNguyenDan;
      case AppBackGround.LE_TINH_NHAN:
        return ImageAssets.bgLeTinhNhan;
      case AppBackGround.NGAY_QUOC_TE_PHU_NU:
        return ImageAssets.bgQuocTePhuNu;

      case AppBackGround.GIO_TO_HUNG_VUONG:
        return ImageAssets.bgGioToHungVuong;

      case AppBackGround.NGAY_QUOC_TE_LAO_DONG:
        return ImageAssets.bgQuocTeLaoDong;

      case AppBackGround.NGAY_QUOC_TE_THIEU_NHI:
        return ImageAssets.bgQuocTeThieuNhi;

      case AppBackGround.NGAY_QUOC_KHANH:
        return ImageAssets.bgQuocKhanh;

      case AppBackGround.TET_TRUNG_THU:
        return ImageAssets.bgTetTrungThu;

      case AppBackGround.NGAY_PHU_NU_VIET_NAM:
        return ImageAssets.bgPhuNuVietNam;

      case AppBackGround.NGAY_LE_GIANG_SINH:
        return ImageAssets.bgLeGiangSinh;
      case AppBackGround.NGAY_HALLOWEEN:
        return ImageAssets.bgHalloween;

      case AppBackGround.NGAY_NHA_GIAO_VIET_NAM:
        return ImageAssets.bgNhaGiaoVietNam;
    }
  }
}
