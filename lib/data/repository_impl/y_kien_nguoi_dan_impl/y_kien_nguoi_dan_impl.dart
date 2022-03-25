import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/dash_board_phan_loai_yknd_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/dash_board_yknd_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/thong_tin_y_kien_nguoi_dan_resopnse.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/y_kien_nguoi_dan/y_kien_nguoi_dan_service.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/dash_board_phan_loai_mode.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/dash_boarsh_yknd_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/thong_tin_y_kien_model.dart';
import 'package:ccvc_mobile/domain/repository/y_kien_nguoi_dan/y_kien_nguoi_dan_repository.dart';

class YKienNguoiDanImpl implements YKienNguoiDanRepository {
  final YKienNguoiDanService _yKienNguoIDanService;

  YKienNguoiDanImpl(this._yKienNguoIDanService);

  @override
  Future<Result<DashboardTinhHinhXuLuModel>> dasdBoardTinhHinhXuLy(
    String donViId,
    String fromDate,
    String toDate,
  ) {
    return runCatchingAsync<DashBoashTinhHinhXuLyResponse,
        DashboardTinhHinhXuLuModel>(
      () => _yKienNguoIDanService.getDashBoardTinhHinhXuLy(
        donViId,
        fromDate,
        toDate,
      ),
      (res) => res.toDomain(),
    );
  }

  @override
  Future<Result<PhanLoaiModel>> dasdBoardPhanLoai(
    String donViId,
    String fromDate,
    String toDate,
  ) {
    return runCatchingAsync<DashBoashPhanLoaiResponse, PhanLoaiModel>(
      () => _yKienNguoIDanService.getDashBoardPhanLoai(
        donViId,
        fromDate,
        toDate,
      ),
      (res) => res.toDomain(),
    );
  }

  @override
  Future<Result<ThongTinYKienModel>> thongTingNguoiDan(
      String donViId, String fromDate, String toDate) {
      return runCatchingAsync<ThongTinYKienNguoiDanResponse, ThongTinYKienModel>(
          () => _yKienNguoIDanService.getThongTinYKienNguoiDan(
        donViId,
        fromDate,
        toDate,
      ),
          (res) => res.toDomain(),
    );
  }
}
