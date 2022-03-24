import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tat_ca_chu_de/tin_tuc_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/dash_board_phan_loai_mode.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/dash_boarsh_yknd_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/thong_tin_y_kien_model.dart';

mixin YKienNguoiDanRepository {
  Future<Result<DashboardTinhHinhXuLuModel>> dasdBoardTinhHinhXuLy(
    String donViId,
    String fromDate,
    String toDate,
  );

  Future<Result<PhanLoaiModel>> dasdBoardPhanLoai(
    String donViId,
    String fromDate,
    String toDate,
  );

  Future<Result<ThongTinYKienModel>> thongTingNguoiDan(
    String donViId,
    String fromDate,
    String toDate,
  );
}
