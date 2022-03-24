import 'dart:ui';
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/dashboard_schedule.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/dash_boarsh_yknd_model.dart';
import 'package:ccvc_mobile/domain/model/y_kien_nguoi_dan/nguoi_dan_model.dart';
import 'package:ccvc_mobile/domain/repository/y_kien_nguoi_dan/y_kien_nguoi_dan_repository.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/calender_work/ui/mobile/widget/custom_item_calender_work.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/block/y_kien_nguoidan_state.dart';
import 'package:ccvc_mobile/presentation/y_kien_nguoi_dan/ui/mobile/widgets/indicator_chart.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

enum StatusType { CHUA_THUC_HIEN, DA_HOAN_THANH, DANG_THUC_HIEN }

class YKienNguoiDanCubitt extends BaseCubit<YKienNguoiDanState> {
  YKienNguoiDanCubitt() : super(YKienNguoiDanStateInitial());
  BehaviorSubject<List<bool>> selectTypeYKNDSubject =
      BehaviorSubject.seeded([true, false]);
  bool isCheck = false;
  late String startDate;
  late String endDate;
  final BehaviorSubject<DashboardTinhHinhXuLuModel> _dashBoardTinhHinhXuLy =
      BehaviorSubject<DashboardTinhHinhXuLuModel>();

  final BehaviorSubject<List<ChartData>> _chartTinhHinhXuLy =
      BehaviorSubject<List<ChartData>>();

  final BehaviorSubject<List<ChartData>> _chartPhanLoai =
      BehaviorSubject<List<ChartData>>();

  Stream<List<ChartData>> get listItemCalenderWork => _chartTinhHinhXuLy.stream;

  Stream<List<ChartData>> get chartTinhHinhXuLy => _chartTinhHinhXuLy.stream;


  Stream<List<ChartData>> get chartPhanLoai => _chartPhanLoai.stream;

  Stream<DashboardTinhHinhXuLuModel> get dashBoardTinhHinhXuLy =>
      _dashBoardTinhHinhXuLy.stream;

  List<DashboardSchedule> list = [
    DashboardSchedule(1, '22ssads2', 'Chờ duyệt'),
    DashboardSchedule(2, '2dasdsd22', 'Thời gian'),
    DashboardSchedule(3, '2dasdsd22', 'Thời gian'),
  ];
  List<String> img = [
    ImageAssets.icChoDuyetYKND,
    ImageAssets.icDongHoYKND,
    ImageAssets.icDongHoYKND,
  ];

  List<ChartData> chartYKienNduoiDan = [
    ChartData(S.current.cong_dvc_quoc_gia, 10, choTrinhKyColor),
    ChartData(S.current.thu_dien_tu, 10, labelColor),
    ChartData(S.current.thu_dien_tu_hai, 10, unselectLabelColor),
    ChartData(S.current.ung_dung_chi_dao_dieu_hanh, 5, itemWidgetUsing),
    ChartData(S.current.he_thong_quan_ly_van_ban, 5, itemWidgetNotUse),
  ];
  List<ChartData> chartYKienNduoiDanTablet = [
    ChartData(S.current.thu_dien_tu, 10, labelColor),
    ChartData(S.current.cong_dvc_quoc_gia, 10, numberOfCalenders),
    ChartData(S.current.ung_dung_chi_dao_dieu_hanh, 5, itemWidgetUsing),
    ChartData(S.current.thu_dien_tu_hai, 10, unselectLabelColor),
    ChartData(S.current.he_thong_quan_ly_van_ban, 5, itemWidgetNotUse),
  ];
  List<ChartData> chartColorPhanLoaiYKND = [
    ChartData(S.current.dang_xu_ly, 30, choXuLyColor),
    ChartData(S.current.da_hoan_thanh, 12, daXuLyColor),
    ChartData(S.current.chua_thuc_hien, 14, choVaoSoColor),
  ];

  List<ChartData> chartPhanLoaiYKND = [
    ChartData(S.current.dang_xu_ly, 30, choXuLyColor),
    ChartData(S.current.da_hoan_thanh, 12, daXuLyColor),
    ChartData(S.current.chua_thuc_hien, 14, choVaoSoColor),
  ];
  DocumentDashboardModel dashboardModel = DocumentDashboardModel(
    soLuongTrongHan: 6,
    soLuongDenHan: 12,
    soLuongQuaHan: 20,
  );
  List<ItemIndicator> listIndicator = [
    ItemIndicator(color: numberOfCalenders, title: S.current.cong_dvc_quoc_gia),
    ItemIndicator(color: labelColor, title: S.current.thu_dien_tu),
    ItemIndicator(color: unselectLabelColor, title: S.current.thu_dien_tu_hai),
    ItemIndicator(
      color: itemWidgetUsing,
      title: S.current.ung_dung_chi_dao_dieu_hanh,
    ),
    ItemIndicator(
      color: itemWidgetNotUse,
      title: S.current.he_thong_quan_ly_van_ban,
    ),
  ];
  List<NguoiDanModel> listYKienNguoiDan = [
    NguoiDanModel(
        ngheNghiep: 'Nhan vien van phong that nghiep',
        ngayThang: '18/10/2021',
        ten: 'Ha Kieu Anh',
        statusData: StatusYKien.DANG_XU_LY),
    NguoiDanModel(
        ngheNghiep: 'Nhan vien van phong that nghiep',
        ngayThang: '18/10/2021',
        ten: 'Ha Kieu Anh',
        statusData: StatusYKien.QUA_HAN),
    NguoiDanModel(
      ngheNghiep: 'Nhan vien van phong that nghiep',
      ngayThang: '18/10/2021',
      ten: 'Ha Kieu Anh',
      statusData: StatusYKien.DANG_XU_LY,
    ),
  ];

  void callApi() {
    getDashBoardTinhHinhXuLy(
      '0bf3b2c3-76d7-4e05-a587-9165c3624d76',
      startDate,
      endDate,
    );
    getDashBoardPhanLoai(
      '0bf3b2c3-76d7-4e05-a587-9165c3624d76',
      startDate,
      endDate,
    );
    getThongTinYKienNguoiDan(
      '0bf3b2c3-76d7-4e05-a587-9165c3624d76',
      startDate,
      endDate,
    );
  }

  final YKienNguoiDanRepository _YKNDRepo = Get.find();


  Future<void> getThongTinYKienNguoiDan(
      String donViID,
      String startDate,
      String enDate,
      ) async {
    showLoading();
    final result = await _YKNDRepo.thongTingNguoiDan(
      donViID,
      startDate,
      enDate,
    );
    showContent();
    result.when(
      success: (res) {
      },
      error: (err) {
        return;
      },
    );
  }

  Future<void> getDashBoardTinhHinhXuLy(
    String donViID,
    String startDate,
    String enDate,
  ) async {
    showLoading();
    final result = await _YKNDRepo.dasdBoardTinhHinhXuLy(
      donViID,
      startDate,
      enDate,
    );
    showContent();
    result.when(
      success: (res) {
        final listDataTinhHinhXuLy = res.tinhHinhXuLyModel.listTinhHinh;
        listDataTinhHinhXuLy
            .map(
              (e) => ChartData(
                e.status,
                e.soLuong.toDouble(),
                getColorStatus(
                  e.status.vietNameseParse().replaceAll(' ', '_').toUpperCase(),
                ),
              ),
            )
            .toList();
        _dashBoardTinhHinhXuLy.sink.add(res);
      },
      error: (err) {
        return;
      },
    );
  }

  Future<void> getDashBoardPhanLoai(
    String donViID,
    String startDate,
    String enDate,
  ) async {
    showLoading();
    final result = await _YKNDRepo.dasdBoardPhanLoai(
      donViID,
      startDate,
      enDate,
    );
    showContent();
    result.when(
      success: (res) {
        // final listDataTinhHinhXuLy = res.listPhanLoai;
        // listDataTinhHinhXuLy
        //     .map(
        //       (e) => ChartData(
        //     e.status,
        //     e.soLuong.toDouble(),
        //     getColorStatus(
        //       e.status.vietNameseParse().replaceAll(' ', '_').toUpperCase(),
        //     ),
        //   ),
        // )
         //   .toList();
        // _dashBoardPhanLoai.sink.add(res);
      },
      error: (err) {
        return;
      },
    );
  }

  Color getColorStatus(String status) {
    Color colorResult = Colors.transparent;
    switch (status) {
      case 'CHUA_THUC_HIEN':
        colorResult = choVaoSoColor;
        break;
      case 'DA_HOAN_THANH':
        colorResult = daXuLyColor;
        break;
      case 'DANG_THUC_HIEN':
        colorResult = choVaoSoColor;
        break;
    }
    return colorResult;
  }

  void initTimeRange() {
    startDate = DateTime.now().toStringWithListFormat;
    endDate = DateTime.now().toStringWithListFormat;
  }
}
