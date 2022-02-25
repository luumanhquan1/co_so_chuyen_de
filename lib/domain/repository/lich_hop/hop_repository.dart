import 'package:ccvc_mobile/data/request/lich_hop/category_list_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/danh_sach_lich_hop_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/nguoi_chu_tri_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/them_y_kien_hop_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/tao_phien_hop_request.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/so_luong_phat_bieu_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/chuong_trinh_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/chi_tiet_lich_hop_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/danh_sach_lich_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/danh_sach_phien_hop_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/dash_board_lich_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/list_phien_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/loai_select_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/nguoi_chu_tri_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/select_phien_hop_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/them_y_kiem_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/tao_phien_hop_model.dart';

mixin HopRepository {
  Future<Result<DashBoardLichHopModel>> getDashBoardLichHop(
    String dateStart,
    String dateTo,
  );

  Future<Result<DanhSachLichHopModel>> postDanhSachLichHop(
    DanhSachLichHopRequest body,
  );

  Future<Result<List<LoaiSelectModel>>> getLoaiHop(
    CatogoryListRequest catogoryListRequest,
  );

  Future<Result<List<LoaiSelectModel>>> getLinhVuc(
    CatogoryListRequest catogoryListRequest,
  );

  Future<Result<List<NguoiChutriModel>>> getNguoiChuTri(
    NguoiChuTriRequest nguoiChuTriRequest,
  );

  Future<Result<List<NguoiChutriModel>>> getDanhSachNguoiChuTriPhienHop(
    String id,
  );

  Future<Result<List<ListPhienHopModel>>> getDanhSachPhienHop(
    String id,
  );

  Future<Result<ChiTietLichHopModel>> getChiTietLichHop(String id);

  Future<Result<ThemYKiemModel>> themYKienHop(
      ThemYKienRequest themYKienRequest);

  Future<Result<ChuongTrinhHopModel>> getChuongTrinhHop(
    String id,
  );

  Future<Result<SoLuongPhatBieuModel>> getSoLuongPhatBieu(String id);

  Future<Result<TongPhienHopModel>> getTongPhienHop(
    String id,
  );

  Future<Result<SelectPhienHopModel>> slectPhienHop(
    String id,
  );

  Future<Result<List<TaoPhienHopModel>>> getThemPhienHop(
    String lichHopId,
    TaoPhienHopRepuest taoPhienHopRepuest,
  );

  Future<Result<ChuongTrinhHopModel>> getDanhSachCanBoTPTG(String id);
}
