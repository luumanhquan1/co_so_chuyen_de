import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/dash_board_phan_loai_mode.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/dash_boarsh_yknd_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/thong_tin_y_kien_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/y_kien_nguoi_dan%20_model.dart';

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

  Future<Result<DanhSachYKienNguoiDan>> danhSachYKienNguoiDan(
    String tuNgay,
    String denNgay,
    int pageSize,
    int pageNumber,
    String userId,
    String donViId,
  );
}
