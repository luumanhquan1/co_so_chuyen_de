import 'package:ccvc_mobile/data/request/hop/category_list_request.dart';
import 'package:ccvc_mobile/data/request/hop/nguoi_chu_tri_request.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/loai_select_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/nguoi_chu_tri_model.dart';

abstract class HopRepository {
  Future<Result<List<LoaiSelectModel>>> getLoaiHop(
    CatogoryListRequest catogoryListRequest,
  );
  Future<Result<List<LoaiSelectModel>>> getLinhVuc(
    CatogoryListRequest catogoryListRequest,
  );

  Future<Result<List<NguoiChutriModel>>> getNguoiChuTri(
      NguoiChuTriRequest nguoiChuTriRequest);

  Future<Result<List<NguoiChutriModel>>> getDanhSachNguoiChuTriPhienHop(
      String id);
}
