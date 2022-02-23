import 'package:ccvc_mobile/data/request/lich_hop/category_list_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/nguoi_chu_tri_request.dart';
import 'package:ccvc_mobile/data/request/lich_lam_viec/danh_sach_lich_lam_viec_request.dart';
import 'package:ccvc_mobile/data/request/list_lich_lv/list_lich_lv_request.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/loai_select_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/nguoi_chu_tri_model.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/danh_sach_lich_lam_viec.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/cancel_lich_lam_viec_model.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec_model.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/bao_cao_model.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/lich_lam_viec_dashbroad.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/lich_lam_viec_dashbroad_item.dart';
import 'package:ccvc_mobile/domain/model/message_model.dart';
import 'package:ccvc_mobile/domain/model/list_lich_lv/list_lich_lv_model.dart';


mixin LichLamViecRepository {
  Future<Result<LichLamViecDashBroad>> getLichLv(
    String startTime,
    String endTime,
  );

  Future<Result<List<LichLamViecDashBroadItem>>> getLichLvRight(
    String dateStart,
    String dateTo,
    int type,
  );

  Future<Result<DanhSachLichlamViecModel>> postDanhSachLichLamViec(
    DanhSachLichLamViecRequest body,
  );

  Future<Result<List<LoaiSelectModel>>> getLoaiLich(
    CatogoryListRequest catogoryListRequest,
  );

  Future<Result<List<NguoiChutriModel>>> getNguoiChuTri(
      NguoiChuTriRequest nguoiChuTriRequest);

  Future<Result<List<LoaiSelectModel>>> getLinhVuc(
    CatogoryListRequest catogoryListRequest,
  );
  Future<Result<ChiTietLichLamViecModel>> detailCalenderWork(
      String id,
      );
  Future<Result<List<BaoCaoModel>>> getDanhSachBaoCao(String scheduleId);

  Future<Result<MessageModel>> deleteBaoCaoKetQua(String id);


  Future<Result<DataLichLvModel>> getListLichLamViec(
    ListLichLvRequest lichLvRequest,
  );


  Future<Result<CancelLichLamViecModel>> cancelCalenderWork(String id);

}
