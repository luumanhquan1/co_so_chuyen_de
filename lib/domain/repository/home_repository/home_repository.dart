import 'package:ccvc_mobile/data/request/home/danh_sach_van_ban_den_request.dart';
import 'package:ccvc_mobile/data/request/home/nhiem_vu_request.dart';
import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/home/calendar_metting_model.dart';
import 'package:ccvc_mobile/domain/model/home/date_model.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/domain/model/home/document_model.dart';
import 'package:ccvc_mobile/domain/model/home/pham_vi_model.dart';
import 'package:ccvc_mobile/domain/model/home/tinh_hinh_y_kien_model.dart';
import 'package:ccvc_mobile/domain/model/home/tinh_huong_khan_cap_model.dart';
import 'package:ccvc_mobile/domain/model/home/tong_hop_nhiem_vu_model.dart';
import 'package:ccvc_mobile/domain/model/widget_manage/widget_model.dart';

abstract class HomeRepository {
  Future<Result<PhamViModel>> getPhamVi();

  Future<Result<DateModel>> getLunarDate(String inputDate);

  Future<Result<List<TinhHuongKhanCapModel>>> getTinhHuongKhanCap();

  Future<Result<List<WidgetModel>>> getDashBoardConfig();

  Future<Result<DocumentDashboardModel>> getVBden(
      String ngayDauTien, String ngayCuoiCung);

  Future<Result<DocumentDashboardModel>> getVBdi(
      String ngayDauTien, String ngayCuoiCung);

  Future<Result<List<DocumentModel>>> getDanhSachVanBan(
      DanhSachVBRequest danhSachVBRequest);

  Future<Result<List<DocumentModel>>> searchDanhSachVanBan(
      SearchVBRequest searchVBRequest);

  Future<Result<List<TongHopNhiemVuModel>>> getTongHopNhiemVu(
      bool isCaNhan, String ngayDauTien, String ngayCuoiCung);

  Future<Result<List<CalendarMeetingModel>>> getNhiemVu(
      NhiemVuRequest nhiemVuRequest);

  Future<Result<List<TinhHinhYKienModel>>> getTinhHinhYKienNguoiDan(
      String donViId, String tuNgay, String denNgay);

  Future<Result<List<DocumentModel>>> getYKienNguoidan(
      int pageSize,
      int page,
      String trangThai,
      String tuNgay,
      String denNgay,
      String donViId,
      String userId,
      [String? loaiMenu]
      );
}