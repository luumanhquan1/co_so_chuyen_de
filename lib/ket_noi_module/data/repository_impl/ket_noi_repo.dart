import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/detail_chung_ket_noi_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/list_chung_ket_noi_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/trong_nuoc_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/service/ket_noi_service.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/danh_sach_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/trong_nuoc.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/detail_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/repository/ket_noi_repository.dart';

class KetNoiRepoImpl implements KetNoiRepository {
  final KetNoiService _ketNoiService;

  KetNoiRepoImpl(this._ketNoiService);

  @override
  Future<Result<DataDanhSachChungModel>> ketNoiListChung(
    int pageIndex,
    int pageSize,
    String type,
  ) {
    return runCatchingAsync<ListChungKetNoiResponse, DataDanhSachChungModel>(
      () => _ketNoiService.getListChungKetNoi(pageIndex, pageSize, type),
      (response) => response.data.toDomain(),
    );
  }

  @override
  Future<Result<TrongNuocModel>> getDataTrongNuoc(
      int pageIndex, int pageSize, String category, bool fullSize,) {
    return runCatchingAsync<TrongNuocResponse, TrongNuocModel>(
      () => _ketNoiService.getListTrongNuoc(
          pageIndex, pageSize, category, fullSize),
      (response) => response.data.toModel(),
    );
  }

  @override
  Future<Result<DetailChungModel>> detailChungKetNoi(String id) {
    return runCatchingAsync<DetailKetNoiResponse, DetailChungModel>(
      () => _ketNoiService.getDetailChungKetNoi(id),
      (response) => response.data.toDomain(),
    );
  }
}
