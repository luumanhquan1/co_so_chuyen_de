import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/bao_cao_thong_ke/bar_chart_model.dart';
import 'package:ccvc_mobile/domain/repository/bao_chi_mang_xa_hoi/bao_chi_mang_xa_hoi_repository.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/bao_cao_thong_ke/bloc/bao_cao_thong_ke_bcmxh_state.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class BaoCaoThongKeBCMXHCubit extends BaseCubit<BaoCaoThongKeBCMXhState> {
  BaoCaoThongKeBCMXHCubit() : super(BaoCaoThongKeBCMXhStateInitial());

  final BehaviorSubject<List<BarChartModel>> _chartTongQuan =
      BehaviorSubject<List<BarChartModel>>();

  Stream<List<BarChartModel>> get chartTongQuan => _chartTongQuan.stream;

  final List<BarChartModel> chartDataTongQuan = [];

  final BaoChiMangXaHoiRepository _BCMXHRepo = Get.find();

  Future<void> getTongQuanBaoCao() async {
    showLoading();
    final result = await _BCMXHRepo.tongQuanBaoCaoThongKe(
      '2022/03/01 00:00:00',
      '2022/04/08 00:00:00',
      848,
    );
    showContent();
    result.when(
      success: (res) {
        chartDataTongQuan.add(
          BarChartModel(soLuong: res.tongTin ?? 0, ten: S.current.tong_tin),
        );
        chartDataTongQuan.add(
          BarChartModel(
            soLuong: res.mangXaHoi ?? 0,
            ten: S.current.mang_xa_hoi,
          ),
        );
        chartDataTongQuan.add(
          BarChartModel(soLuong: res.baoChi ?? 0, ten: S.current.bao_chi),
        );
        chartDataTongQuan.add(
          BarChartModel(soLuong: res.forum ?? 0, ten: S.current.forum),
        );
        chartDataTongQuan.add(
          BarChartModel(soLuong: res.blog ?? 0, ten: S.current.blog),
        );
        chartDataTongQuan.add(
          BarChartModel(soLuong: res.nguonKhac ?? 0, ten: S.current.nguon_khac),
        );
        _chartTongQuan.sink.add(chartDataTongQuan);
      },
      error: (err) {
        return;
      },
    );
  }

  bool checkDataList(List<dynamic> data) {
    for (final i in data) {
      if (i.soLuong != 0) return true;
    }
    return false;
  }
}
