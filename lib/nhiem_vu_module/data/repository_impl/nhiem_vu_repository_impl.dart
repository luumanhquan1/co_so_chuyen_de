import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/response/chi_tiet_nhiem_vu_response.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/response/lich_su_phan_xu_ly_nhiem_vu_response.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/response/y_kien_su_ly_nhiem_vu_response.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/service/nhiem_vu_service.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/chi_tiet_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_phan_xu_ly.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/y_kien_su_ly_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/repository/nhiem_vu_repository.dart';

class NhiemVuRepoImpl implements NhiemVuRepository {
  final NhiemVuService nhiemVuService;

  NhiemVuRepoImpl(this.nhiemVuService);

  @override
  Future<Result<ChiTietNhiemVuModel>> getChiTietNhiemVu(
      String nhiemVuId, bool isCaNhan) {
    return runCatchingAsync<DataChiTietNhiemVuResponse, ChiTietNhiemVuModel>(
      () => nhiemVuService.getChiTietNhiemVu(nhiemVuId, isCaNhan),
      (response) => response.data?.toModel() ?? ChiTietNhiemVuModel(),
    );
  }

  @override
  Future<Result<List<LichSuPhanXuLyNhiemVuModel>>> getLichSuPhanXuLy(
      String nhiemVuId) {
    return runCatchingAsync<DataLichSuPhanXuLyNhiemVuModelResponse,
        List<LichSuPhanXuLyNhiemVuModel>>(
      () => nhiemVuService.getLichSuPhanXuLy(nhiemVuId),
      (response) => response.data?.map((e) => e.toModel()).toList() ?? [],
    );
  }

  @override
  Future<Result<List<YKienSuLyNhiemVuModel>>> getYKienXuLyNhiemVu(
      String nhiemVuId) {
    return runCatchingAsync<DataYKienXuLyFileDinhKemResponse,
            List<YKienSuLyNhiemVuModel>>(
        () => nhiemVuService.getYKienXuLyNhiemVu(nhiemVuId),
        (response) => response.data?.map((e) => e.toModel()).toList()??[],
    );
  }
}
