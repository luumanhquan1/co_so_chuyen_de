import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tat_ca_chu_de/dashboard_item.dart';

mixin BaoChiMangXaHoiRepository {
  Future<Result<ListDashBoardItemModel>> getDashBoardTatCaChuDe(
    int pageIndex,
    int pageSize,
    int total,
    bool hasNextPage,
    String fromDate,
    String toDate,
  );
}
