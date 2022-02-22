import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/dash_board_lich_hop.dart';

mixin HopRepository {
  Future<Result<DashBoardLichHopModel>> getDashBoardLichHop(
      String dateStart, String dateTo,);
}
