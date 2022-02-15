import 'package:ccvc_mobile/data/request/quan_ly_van_ban/dash_board_vb_di_request.dart';
import 'package:ccvc_mobile/data/response/quan_ly_van_ban/vb_di_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/quan_ly_van_ban/qlvb_service.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/vbdi_model.dart';
import 'package:ccvc_mobile/domain/repository/qlvb_repository/qlvb_repository.dart';

class QLVBImlp implements QLVBRepository {
  final QuanLyVanBanClient _quanLyVanBanClient;

  QLVBImlp(this._quanLyVanBanClient);

  // @override
  // Future<Result<VBDenModel>> getVBDen(
  //     String startTime, String endTime) {
  //   return runCatchingAsync<VBDenResponse, VBDenModel>(
  //     () => _quanLyVanBanClient.getVbDen(startTime, endTime),
  //     (response) => response.toDomain(),
  //   );
  // }

  @override
  Future<Result<VBDiModel>> getVBDi(String startTime, String endTime) {
    return runCatchingAsync<VBDiResponse, VBDiModel>(
      () => _quanLyVanBanClient
          .getVbDi(VBDiRequest(NgayDauTien: startTime, NgayCuoiCung: endTime)),
      (response) {
        return response.data.toDomainVBDi();
      },
    );
  }
}
