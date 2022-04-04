import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/base/base_state.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/request/danh_sach_cong_viec_request.dart';
import 'package:ccvc_mobile/nhiem_vu_module/data/request/danh_sach_nhiem_vu_request.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_cong_viec_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/danh_sach_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/dash_broash/dash_broash_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/repository/nhiem_vu_repository.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_state.dart';
import 'package:ccvc_mobile/nhiem_vu_module/utils/constants/api_constants.dart';
import 'package:ccvc_mobile/nhiem_vu_module/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/utils/constants/app_constants.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class DanhSachCubit extends BaseCubit<BaseState> {
  DanhSachCubit() : super(DanhSachStateInitial());

  NhiemVuRepository get repo => Get.find();
  int pageSize = 10;
  int pageIndex = 1;
  String keySearch = '';
  BehaviorSubject<List<PageData>> dataSubject = BehaviorSubject();
  BehaviorSubject<List<PageDatas>> dataSubjects = BehaviorSubject();

  void callApi() {
    postDanhSachCongViec(
      hanXuLy: {'FromDate': '2020/04/01', 'ToDate': '2022/05/15'},
      index: pageIndex,
      isCaNhan: false,
      isSortByHanXuLy: true,
      keySearch: keySearch,
      mangTrangThai: [],
      size: pageSize,
      trangThaiHanXuLy: '',
    );
    postDanhSachNhiemVu(
      index: pageIndex,
      isNhiemVuCaNhan: true,
      isSortByHanXuLy: true,
      mangTrangThai: [],
      ngayTaoNhiemVu: {'FromDate': '2020/04/01', 'ToDate': '2022/05/15'},
      size: pageSize,
    );
    getDashBroashNhiemVu(ngayDauTien: '2020/04/01', ngayCuoiCung: '2022/05/15');
    getDashBroashCongViec(
      ngayDauTien: '2020/04/01',
      ngayCuoiCung: '2022/05/15',
    );
  }

  Future<void> postDanhSachNhiemVu({
    required int index,
    required bool isNhiemVuCaNhan,
    required bool isSortByHanXuLy,
    required List<String> mangTrangThai,
    required Map<String, String> ngayTaoNhiemVu,
    required int size,
  }) async {
    final DanhSachNhiemVuRequest danhSachNhiemVuRequest =
        DanhSachNhiemVuRequest(
      index: index,
      isNhiemVuCaNhan: isNhiemVuCaNhan,
      isSortByHanXuLy: isSortByHanXuLy,
      mangTrangThai: mangTrangThai,
      ngayTaoNhiemVu: ngayTaoNhiemVu,
      size: size,
    );
    loadMorePage = pageIndex;
    final result = await repo.danhSachNhiemVu(danhSachNhiemVuRequest);
    result.when(
      success: (res) {
        dataSubject.sink.add(res.pageData ?? []);
        if (pageIndex == ApiConstants.PAGE_BEGIN) {
          if (res.pageData?.isEmpty ?? true) {
            showEmpty();
          } else {
            showContent();
            emit(CompletedLoadMore(CompleteType.SUCCESS, posts: res.pageData));
          }
        } else {
          emit(CompletedLoadMore(CompleteType.SUCCESS, posts: res.pageData));
        }
      },
      error: (error) {
        emit(const CompletedLoadMore(CompleteType.ERROR));
        showError();
      },
    );
  }

  Future<void> postDanhSachCongViec({
    required Map<String, String>? hanXuLy,
    required int? index,
    required bool? isCaNhan,
    required bool? isSortByHanXuLy,
    required String? keySearch,
    required List<String>? mangTrangThai,
    required int? size,
    required String? trangThaiHanXuLy,
  }) async {
    final DanhSachCongViecRequest danhSachCongViecRequest =
        DanhSachCongViecRequest(
      hanXuLy: hanXuLy,
      index: index,
      isCaNhan: isCaNhan,
      isSortByHanXuLy: isSortByHanXuLy,
      keySearch: keySearch,
      mangTrangThai: mangTrangThai,
      size: size,
      trangThaiHanXuLy: trangThaiHanXuLy,
    );
    loadMorePage = index ?? 1;
    final result = await repo.danhSachCongViec(danhSachCongViecRequest);
    result.when(
      success: (res) {
        dataSubjects.sink.add(res.pageData ?? []);
        if (index == ApiConstants.PAGE_BEGIN) {
          if (res.pageData?.isEmpty ?? true) {
            showEmpty();
          } else {
            showContent();
            emit(CompletedLoadMore(CompleteType.SUCCESS, posts: res.pageData));
          }
        } else {
          emit(CompletedLoadMore(CompleteType.SUCCESS, posts: res.pageData));
        }
      },
      error: (error) {
        emit(const CompletedLoadMore(CompleteType.ERROR));
        showError();
      },
    );
  }

  BehaviorSubject<List<LoaiNhiemVuComomModel>> loaiNhiemVuSuject =
      BehaviorSubject();
  BehaviorSubject<List<ChartData>> statusSuject = BehaviorSubject();
  List<ChartData> chartData = [];

  Future<void> getDashBroashNhiemVu({
    required String ngayDauTien,
    required String ngayCuoiCung,
  }) async {
    final result = await repo.getDashBroashNhiemVu(ngayDauTien, ngayCuoiCung);
    result.when(
      success: (res) {
        loaiNhiemVuSuject.sink.add(res.data?.trangThaiXuLy ?? []);

        chartData = (res.data?.trangThai ?? [])
            .map(
              (e) => ChartData(
                e.text ?? '',
                (e.value ?? 0).toDouble(),
                (e.giaTri ?? '').trangThaiToColor(),
              ),
            )
            .toList();
        statusSuject.sink.add(chartData);
        showContent();
      },
      error: (error) {
        showError();
      },
    );
  }

  BehaviorSubject<List<LoaiNhiemVuComomModel>> loaiCongViecSuject =
      BehaviorSubject();
  BehaviorSubject<List<ChartData>> statusCongViecSuject = BehaviorSubject();
  List<ChartData> chartDataCongViec = [];

  Future<void> getDashBroashCongViec({
    required String ngayDauTien,
    required String ngayCuoiCung,
  }) async {
    final result = await repo.getDashBroashCongViec(ngayDauTien, ngayCuoiCung);
    result.when(
      success: (res) {
        loaiCongViecSuject.sink.add(res.data?.trangThaiXuLy ?? []);
        chartDataCongViec = (res.data?.trangThai ?? [])
            .map(
              (e) => ChartData(
                e.text ?? '',
                (e.value ?? 0).toDouble(),
                (e.giaTri ?? '').trangThaiToColor(),
              ),
            )
            .toList();
        statusCongViecSuject.sink.add(chartDataCongViec);
        showContent();
      },
      error: (error) {
        showError();
      },
    );
  }

  final List<ChartData> chartDataNhiemVu = [
    ChartData(
      S.current.cho_phan_xu_ly,
      0,
      choXuLyColor,
    ),
    ChartData(
      S.current.da_thuc_hien,
      0,
      daXuLyColor,
    ),
    ChartData(
      S.current.dang_thuc_hien,
      0,
      yellowColor,
    ),
  ];
}
