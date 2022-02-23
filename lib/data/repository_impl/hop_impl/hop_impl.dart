import 'package:ccvc_mobile/data/request/hop/category_list_request.dart';
import 'package:ccvc_mobile/data/request/hop/nguoi_chu_tri_request.dart';
import 'package:ccvc_mobile/data/response/hop/catogory_list_response.dart';
import 'package:ccvc_mobile/data/response/hop/nguoi_chu_trinh_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/hop_service/hop_service.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/loai_select_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/nguoi_chu_tri_model.dart';
import 'package:ccvc_mobile/domain/repository/hop_repository/hop_repository.dart';

class HopImpl extends HopRepository {
  final HopService _service;
  HopImpl(this._service);
  @override
  Future<Result<List<LoaiSelectModel>>> getLoaiHop(
      CatogoryListRequest catogoryListRequest) {
    return runCatchingAsync<CatogoryListResponse, List<LoaiSelectModel>>(
        () => _service.getLoaiHop(catogoryListRequest),
        (res) => res.data?.items?.map((e) => e.toDomain()).toList() ?? []);
  }

  @override
  Future<Result<List<LoaiSelectModel>>> getLinhVuc(
      CatogoryListRequest catogoryListRequest) {
    return runCatchingAsync<CatogoryListResponse, List<LoaiSelectModel>>(
        () => _service.getLinhVuc(catogoryListRequest),
        (res) => res.data?.items?.map((e) => e.toDomain()).toList() ?? []);
  }

  @override
  Future<Result<List<NguoiChutriModel>>> getNguoiChuTri(
      NguoiChuTriRequest nguoiChuTriRequest) {
    return runCatchingAsync<NguoiChuTriResponse, List<NguoiChutriModel>>(
        () => _service.getNguoiChuTri(nguoiChuTriRequest),
        (res) => res.data?.items?.map((e) => e.toDomain()).toList() ?? []);
  }
}
