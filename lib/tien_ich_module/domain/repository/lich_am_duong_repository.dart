import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/lich_am_duong.dart';

mixin LichAmDuongRepository {

  Future<Result<LichAmDuong>> getLichAmDuong(
      String date,
      );
}
