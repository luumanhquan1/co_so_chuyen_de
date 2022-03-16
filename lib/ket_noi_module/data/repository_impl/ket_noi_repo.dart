import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/ket_noi_module/data/request/tao_su_kien_resquest.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/detail_chung_ket_noi_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/list_chung_ket_noi_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/loai_bai_viet_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/response/tao_su_kien_response.dart';
import 'package:ccvc_mobile/ket_noi_module/data/service/ket_noi_service.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/danh_sach_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/detail_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/loai_bai_viet_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/tao_su_kien_model.dart';
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
  Future<Result<DetailChungModel>> detailChungKetNoi(String id) {
    return runCatchingAsync<DetailKetNoiResponse, DetailChungModel>(
      () => _ketNoiService.getDetailChungKetNoi(id),
      (response) => response.data.toDomain(),
    );
  }

  @override
  Future<Result<List<LoaiBaiVietModel>>> loaiBaiViet(String type) {
    return runCatchingAsync<LoaiBaiVietResponse, List<LoaiBaiVietModel>>(
      () => _ketNoiService.getLoaiBaiViet(type),
      (response) => response.toModel(),
    );
  }

  @override
  Future<Result<TaoSuKienModel>> postTaoSuKien(
    TaoSuKienRequest taoSuKienRequest,
  ) {
    return runCatchingAsync<TaoSuKienResponse, TaoSuKienModel>(
      () => _ketNoiService.postTaoSuKien(taoSuKienRequest),
      (response) => response.toDoMain(),
    );
  }
}
