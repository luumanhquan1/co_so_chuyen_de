import 'package:ccvc_mobile/data/request/lich_hop/danh_sach_lich_hop_request.dart';
import 'package:ccvc_mobile/data/response/lich_hop/danh_sach_lich_hop_response.dart';
import 'package:ccvc_mobile/data/response/lich_hop/dash_board_lh_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/lich_hop/hop_services.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/danh_sach_lich_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/dash_board_lich_hop.dart';
import 'package:ccvc_mobile/domain/repository/hop_repository.dart';

class HopRepositoryImpl implements HopRepository {
  final HopServices _hopServices;

  HopRepositoryImpl(this._hopServices);

  @override
  Future<Result<DashBoardLichHopModel>> getDashBoardLichHop(
    String dateStart,
    String dateTo,
  ) {
    return runCatchingAsync<DashBoardLichHopResponse, DashBoardLichHopModel>(
      () => _hopServices.getData(dateStart, dateTo),
      (response) => response.data?.toModel() ?? DashBoardLichHopModel.empty(),
    );
  }

  @override
  Future<Result<DanhSachLichHopModel>> postDanhSachLichHop(
      DanhSachLichHopRequest body,) {
    return runCatchingAsync<DanhSachLichHopResponse, DanhSachLichHopModel>(
      () => _hopServices.postData(body),
      (response) => response.data?.toModel() ?? DanhSachLichHopModel.empty(),
    );
  }
}
