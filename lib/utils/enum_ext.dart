import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';



extension SelectKeyExt on SelectKey {
  String getText() {
    switch (this) {
      case SelectKey.TAT_CA:
        return S.current.all;
      case SelectKey.DON_VI:
        return S.current.unit;
      case SelectKey.HOM_NAY:
        return S.current.today;
      case SelectKey.TUAN_NAY:
        return S.current.this_week;
      case SelectKey.THANG_NAY:
        return S.current.this_month;
      case SelectKey.NAM_NAY:
        return S.current.this_year;
      case SelectKey.CHO_XU_LY_VB_DEN:
        return S.current.cho_xu_ly_vb_den;
      case SelectKey.CHO_CHO_Y_KIEN_VB_DEN:
        return S.current.cho_cho_y_kien_VB_den;
      case SelectKey.CHO_XU_LY:
        return S.current.cho_xu_ly;
      case SelectKey.DANG_XU_LY:
        return S.current.dang_xu_ly;
      case SelectKey.CHO_TIEP_NHAN:
        return S.current.cho_tiep_nhan;
      case SelectKey.LICH_CUA_TOI:
        return S.current.lich_cua_toi;
      case SelectKey.LICH_DUOC_MOI:
        return S.current.lich_duoc_moi;
      case SelectKey.LICH_HOP_DUOC_MOI:
        return S.current.lich_hop_duoc_moi;
      case SelectKey.LICH_HOP_CAN_DUYET:
        return S.current.lich_hop_can_duyet;
      case SelectKey.LICH_DUYET_PHONG:
        return S.current.lich_duyet_phong;
      case SelectKey.LICH_HOP_DUYET_THIET_BI:
        return S.current.lich_hop_duyet_thiet_bi;
      case SelectKey.LICH_HOP_DUYET_YEU_CAU_CHUAN_BI:
        return S.current.lich_hop_duyet_yeu_cau_tb;
      case SelectKey.CHO_TRINH_KY_VB_DI:
        return S.current.cho_trinh_ky_VB_di;
    }
  }
}
