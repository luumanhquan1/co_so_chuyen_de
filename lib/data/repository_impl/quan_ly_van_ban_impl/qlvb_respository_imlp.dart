import 'package:ccvc_mobile/data/request/quan_ly_van_ban/danh_sach_vb_di_request.dart';
import 'package:ccvc_mobile/data/request/quan_ly_van_ban/dash_board_vb_den_request.dart';
import 'package:ccvc_mobile/data/request/quan_ly_van_ban/dash_board_vb_di_request.dart';
import 'package:ccvc_mobile/data/response/quan_ly_van_ban/ds_vbden_response.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/data/services/quan_ly_van_ban/qlvb_service.dart';
import 'package:ccvc_mobile/domain/model/document/incoming_document.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/van_ban_model.dart';
import 'package:ccvc_mobile/domain/repository/qlvb_repository/qlvb_repository.dart';
class QLVBImlp implements QLVBRepository {
  final QuanLyVanBanClient _quanLyVanBanClient;

  QLVBImlp(this._quanLyVanBanClient);

  // @override
  // Future<Result<VBDenModel>> getVBDen(String startTime, String endTime) {
  //   return runCatchingAsync<VBDenResponse, VBDenModel>(
  //     () => _quanLyVanBanClient.getVbDen(
  //       VBDenRequest(
  //         NgayDauTien: startTime,
  //         NgayCuoiCung: endTime,
  //       ),
  //     ),
  //     (response) => response.toDomain(),
  //   );
  // }

  // @override
  // Future<Result<VBDiModel>> getVBDi(String startTime, String endTime) {
  //   return runCatchingAsync<VBDiResponse, VBDiModel>(
  //     () => _quanLyVanBanClient
  //         .getVbDi(VBDiRequest(NgayDauTien: startTime, NgayCuoiCung: endTime)),
  //     (response) {
  //       return response.data.toDomainVBDi();
  //     },
  //   );
  // }

  @override
  Future<Result<DanhSachVanBanModel>> getVanBanModel() {
    return runCatchingAsync<DanhSachVBDenResponse, DanhSachVanBanModel>(
      () => _quanLyVanBanClient.getListVBDen(),
      (response) {
        return response.danhSachVB.toDomain();
      },
    );
  }

  // @override
  // Future<Result<PageVBDiModel>> getDanhSachVbDi(String startDate, String endDate, int index, int size) {
  //   // TODO: implement getDanhSachVbDi
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Result<PageVBDiModel>> getDanhSachVbDi(
  //     String startDate, String endDate, int index, int size,) {
  //   return runCatchingAsync<DanhSachVBDiResponse, PageVBDiModel>(
  //     () => _quanLyVanBanClient.getListVBDi(DanhSachVBDiRequest(
  //         ThoiGianStartFilter: startDate,
  //         ThoiGianEndFilter: endDate,
  //         Size: size,
  //         Index: index,
  //        ),),
  //     (response) {
  //       return response.toDomain();
  //     },
  //   );
  // }
}
