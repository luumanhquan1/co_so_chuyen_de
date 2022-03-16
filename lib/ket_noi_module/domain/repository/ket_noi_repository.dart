import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/ket_noi_module/data/request/tao_su_kien_resquest.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/danh_sach_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/detail_chung_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/loai_bai_viet_model.dart';
import 'package:ccvc_mobile/ket_noi_module/domain/model/tao_su_kien_model.dart';

mixin KetNoiRepository {
  Future<Result<DataDanhSachChungModel>> ketNoiListChung(
    int pageIndex,
    int pageSize,
    String type,
  );

  Future<Result<DetailChungModel>> detailChungKetNoi(String id);

  Future<Result<List<LoaiBaiVietModel>>> loaiBaiViet(String type);

  Future<Result<TaoSuKienModel>> postTaoSuKien(
    TaoSuKienRequest taoSuKienRequest,
  );
}
