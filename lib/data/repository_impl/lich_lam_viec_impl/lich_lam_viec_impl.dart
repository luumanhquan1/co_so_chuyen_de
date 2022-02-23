import 'package:ccvc_mobile/data/request/lich_hop/category_list_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/nguoi_chu_tri_request.dart';
import 'package:ccvc_mobile/data/request/lich_lam_viec/danh_sach_lich_lam_viec_request.dart';
import 'package:ccvc_mobile/data/response/lich_hop/catogory_list_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/nguoi_chu_trinh_response.dart';
import 'package:ccvc_mobile/data/response/lich_lam_viec/danh_sach_lich_lam_viec_response.dart';
import 'package:ccvc_mobile/data/response/lich_lam_viec_dashbroad/lich_lam_viec_dashbroad_response.dart';
import 'package:ccvc_mobile/data/response/lich_lam_viec_dashbroad/lich_lam_viec_dashbroad_right_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/lich_lam_viec_service/lich_lam_viec_service.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/loai_select_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/nguoi_chu_tri_model.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/danh_sach_lich_lam_viec.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/lich_lam_viec_dashbroad.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/lich_lam_viec_dashbroad_item.dart';
import 'package:ccvc_mobile/domain/repository/lich_lam_viec_repository/lich_lam_viec_repository.dart';

class LichLamViecImlp implements LichLamViecRepository {
  LichLamViecService lichLamViecService;

  LichLamViecImlp(this.lichLamViecService);

  @override
  Future<Result<LichLamViecDashBroad>> getLichLv(
    String startTime,
    String endTime,
  ) {
    return runCatchingAsync<LichLamViecDashBroadResponse, LichLamViecDashBroad>(
      () => lichLamViecService.getLichLamViec(startTime, endTime),
      (response) => response.data.toDomain(),
    );
  }

  @override
  Future<Result<List<LichLamViecDashBroadItem>>> getLichLvRight(
    String dateStart,
    String dateTo,
    int type,
  ) {
    return runCatchingAsync<LichLamViecDashBroadRightResponse,
        List<LichLamViecDashBroadItem>>(
      () => lichLamViecService.getLichLamViecRight(
        dateStart,
        dateTo,
        type,
      ),
      (response) => response.toDomain(),
    );
  }

  @override
  Future<Result<DanhSachLichlamViecModel>> postDanhSachLichLamViec(
      DanhSachLichLamViecRequest body) {
    return runCatchingAsync<DanhSachLichLamViecResponse,
            DanhSachLichlamViecModel>(
        () => lichLamViecService.postData(body),
        (response) =>
            response.data?.toModel() ?? DanhSachLichlamViecModel.empty());
  }

  @override
  Future<Result<List<LoaiSelectModel>>> getLoaiLich(
      CatogoryListRequest catogoryListRequest,
      ) {
    return runCatchingAsync<CatogoryListResponse, List<LoaiSelectModel>>(
          () => lichLamViecService.getLoaiLichLamViec(catogoryListRequest),
          (res) => res.data?.items?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
  @override
  Future<Result<List<NguoiChutriModel>>> getNguoiChuTri(
      NguoiChuTriRequest nguoiChuTriRequest,
      ) {
    return runCatchingAsync<NguoiChuTriResponse, List<NguoiChutriModel>>(
          () => lichLamViecService.getNguoiChuTri(nguoiChuTriRequest),
          (res) => res.data?.items?.map((e) => e.toDomain()).toList() ?? [],
    );
  }

  @override
  Future<Result<List<LoaiSelectModel>>> getLinhVuc(
      CatogoryListRequest catogoryListRequest,
      ) {
    return runCatchingAsync<CatogoryListResponse, List<LoaiSelectModel>>(
          () => lichLamViecService.getLinhVuc(catogoryListRequest),
          (res) => res.data?.items?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}
