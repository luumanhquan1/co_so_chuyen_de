import 'package:ccvc_mobile/data/request/y_kien_nguoi_dan/chi_tiet_kien_nghi_request.dart';
import 'package:ccvc_mobile/data/request/y_kien_nguoi_dan/danh_sach_y_kien_pakn_request.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/chi_tiet_kien_nghi_respnse.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/danh_sach_ket_qua_y_kien_xu_ly_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/danh_sach_y_kien_nguoi_dan_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/dash_board_phan_loai_yknd_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/dash_board_yknd_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/search_y_kien_nguoi_dan_response.dart';
import 'package:ccvc_mobile/data/response/y_kien_nguoi_dan/thong_tin_y_kien_nguoi_dan_resopnse.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/y_kien_nguoi_dan/y_kien_nguoi_dan_service.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/chi_tiet_yknd_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/dash_board_phan_loai_mode.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/dash_boarsh_yknd_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/thong_tin_y_kien_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/y_kien_nguoi_dan%20_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/y_kien_xu_ly_yknd_model.dart';
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

  @override
  Future<Result<DanhSachYKienNguoiDan>> danhSachYKienNguoiDan(
      String tuNgay,
      String denNgay,
      int pageSize,
      int pageNumber,
      String userId,
      String donViId) {
    return runCatchingAsync<DanhSachYKienNguoiDanResponse,
        DanhSachYKienNguoiDan>(
      () => _yKienNguoIDanService.getDanhSachYKienNguoiDan(
        tuNgay,
        denNgay,
        pageSize,
        pageNumber,
        userId,
        donViId,
      ),
      (res) => res.toDomain(),
    );
  }

  @override
  Future<Result<ChiTietYKNDDataModel>> chiTietYKienNguoiDan(
      String kienNghiId, String taskId) {
    return runCatchingAsync<ChiTietKienNghiResponse, ChiTietYKNDDataModel>(
      () => _yKienNguoIDanService.chiTietYKienNguoiDan(
        ChiTietKienNghiRequest(
          kienNghiId: kienNghiId,
          taskId: taskId,
        ),
      ),
      (res) => res.toDomain(),
    );
  }

  @override
  Future<Result<DanhSachYKienNguoiDan>> searchYKienNguoiDan(
      String tuNgay,
      String denNgay,
      int pageSize,
      int pageNumber,
      String tuKhoa,
      String userId,
      String donViId) {
    return runCatchingAsync<SearchYKienNguoiDanResponse, DanhSachYKienNguoiDan>(
      () => _yKienNguoIDanService.searchDanhSachYKienNguoiDan(
        tuNgay,
        denNgay,
        pageSize,
        pageNumber,
        tuKhoa,
        userId,
        donViId,
      ),
      (res) => res.toDomain(),
    );
  }

  @override
  Future<Result<DanhSachKetQuaYKXLModel>> getDanhSachYKienPAKN(
      String KienNghiId, int type) {
    return runCatchingAsync<DanhSachKetQuaYKXLModelResponse,DanhSachKetQuaYKXLModel>(
        () => _yKienNguoIDanService
            .getDanhSachYKienPAKN(DanhSachYKienPAKNRequest(
          kienNghiId: KienNghiId,
          type: type,
        ),),
        (res) => res.toModel());
  }
}
