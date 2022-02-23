import 'dart:async';
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec_model.dart';
import 'package:ccvc_mobile/domain/repository/lich_lam_viec_repository/lich_lam_viec_repository.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/bao_cao_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_lam_viec/bloc/chi_tiet_lich_lam_viec_state.dart';
import 'package:ccvc_mobile/widgets/dialog/message_dialog/message_config.dart';
import 'package:get/get.dart';
import 'package:queue/queue.dart';
import 'package:rxdart/rxdart.dart';

class ChiTietLichLamViecCubit extends BaseCubit<ChiTietLichLamViecState> {
  BehaviorSubject<ChiTietLichLamViecModel> chiTietLichLamViecSubject =
      BehaviorSubject();


  // chi tiet lich lam viec

  ChiTietLichLamViecCubit() : super(DetailDocumentInitial());


  Stream<ChiTietLichLamViecModel> get chiTietLichLamViecStream =>
      chiTietLichLamViecSubject.stream;
  BehaviorSubject<List<BaoCaoModel>> _listBaoCaoKetQua = BehaviorSubject();

  Stream<List<BaoCaoModel>> get listBaoCaoKetQua => _listBaoCaoKetQua.stream;

  LichLamViecRepository get detailLichLamViec => Get.find();
  String idLichLamViec = '';
  Future<void> data(String id) async {
    final rs = await detailLichLamViec.detailCalenderWork(id);
    rs.when(
        success: (data) {
          chiTietLichLamViecSubject.add(data);
        },
        error: (error) {});
  }


  // huy lich lam viec
  LichLamViecRepository get cancelLichLamViec => Get.find();
  Future<void> cancel(String id) async {
    final rs = await cancelLichLamViec.cancelCalenderWork(id);
    rs.when(
        success: (data) {
          print('trang thai huy: $data');
        },
        error: (error) {});
  }
  Future<void> loadApi(String id) async {
    final queue = Queue(parallel: 2);
    showLoading();
    idLichLamViec = id;
    unawaited(queue.add(() => data(id)));
    unawaited(queue.add(() => getDanhSachBaoCaoKetQua(id)));

    await queue.onComplete;
    showContent();
  }

  Future<void> getDanhSachBaoCaoKetQua(String id) async {
    final result = await detailLichLamViec.getDanhSachBaoCao(id);
    result.when(
        success: (res) {
          _listBaoCaoKetQua.sink.add(res);
        },
        error: (err) {});
  }

  Future<void> xoaBaoCaoKetQua(String id) async {
    showLoading();
    final result = await detailLichLamViec.deleteBaoCaoKetQua(id);
    result.when(
        success: (res) {
          if (res.succeeded ?? false) {
            getDanhSachBaoCaoKetQua(idLichLamViec).whenComplete(() {
              showContent();
              MessageConfig.show(title: S.current.xoa_thanh_cong);
            });
          } else {
            showContent();
          }
        },
        error: (err) {});

  }



  void dispose() {
    _listBaoCaoKetQua.close();
    chiTietLichLamViecSubject.close();
  }
}
