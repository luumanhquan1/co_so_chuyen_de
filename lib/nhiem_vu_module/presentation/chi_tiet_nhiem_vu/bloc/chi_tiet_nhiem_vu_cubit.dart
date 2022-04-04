import 'dart:async';
import 'dart:io';
import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/chi_tiet_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/danh_sach_cong_viec_chi_tiet_nhiem_vu.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_cap_nhat_thth.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_don_doc.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_phan_xu_ly.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_thu_hoi.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/lich_su_tra_lai.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/van_ban_lien_quan.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/model/chi_tiet_nhiem_vu/y_kien_su_ly_nhiem_vu_model.dart';
import 'package:ccvc_mobile/nhiem_vu_module/domain/repository/nhiem_vu_repository.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/chi_tiet_nhiem_vu/bloc/chi_tiet_nv_state.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:queue/queue.dart';
import 'package:rxdart/rxdart.dart';

class ChiTietNVCubit extends BaseCubit<ChiTietNVState> {
  ChiTietNVCubit() : super(ChiTietNVInitial());

  NhiemVuRepository get nhiemVuRepo => Get.find();

  BehaviorSubject<ChiTietNhiemVuModel> chiTietHeaderSubject =
      BehaviorSubject();

  BehaviorSubject<VanBanLienQuanModel> vanBanLienQuanSubject =
      BehaviorSubject();

  BehaviorSubject<List<DanhSachCongViecChiTietNhiemVuModel>> danhsachCongViecSubject =
      BehaviorSubject();

  BehaviorSubject<List<LichSuPhanXuLyNhiemVuModel>> lichSuPhanXuLySubject =
      BehaviorSubject();

  BehaviorSubject<List<LichSuThuHoiModel>> lichSuThuHoiSubject =
      BehaviorSubject();

  BehaviorSubject<List<LichSuCapNhatTHTHModel>> lichSuCapNhatTHTHSubject =
      BehaviorSubject();

  BehaviorSubject<List<LichSuTraLaiModel>> lichSuTraLaiSubject =
      BehaviorSubject();

  BehaviorSubject<List<LichSuDonDocModel>> lichSuDonDocSubject =
      BehaviorSubject();
  BehaviorSubject<List<YKienSuLyNhiemVuModel>> yKienXuLyNhiemVuSubject =
      BehaviorSubject();

  Stream<VanBanLienQuanModel> get vanBanLienQuanStream =>
      vanBanLienQuanSubject.stream;

  Stream<List<LichSuThuHoiModel>> get lichSuThuHoiStream =>
      lichSuThuHoiSubject.stream;

  Stream<List<LichSuDonDocModel>> get lichSuDonDocStream =>
      lichSuDonDocSubject.stream;

  Stream<List<DanhSachCongViecChiTietNhiemVuModel>> get danhSachCongViecStream =>
      danhsachCongViecSubject.stream;

  Stream<List<LichSuTraLaiModel>> get lichSuTraLaiStream =>
      lichSuTraLaiSubject.stream;

  Stream<List<LichSuPhanXuLyNhiemVuModel>> get lichSuPhanXuLyModelStream =>
      lichSuPhanXuLySubject.stream;

  Stream<List<LichSuCapNhatTHTHModel>> get lichSuCapNhatTHTHModelStream =>
      lichSuCapNhatTHTHSubject.stream;
  Stream<List<YKienSuLyNhiemVuModel>> get yKienXuLyNhiemVuStream =>
      yKienXuLyNhiemVuSubject.stream;

  Stream<ChiTietNhiemVuModel> get chiTietHeaderStream =>
      chiTietHeaderSubject.stream;
  Future<void> loadDataNhiemVuCaNhan({
    required String nhiemVuId,

  }) async {
    final queue = Queue(parallel: 4);mod
    unawaited(queue.add(() => getChiTietNhiemVuCaNhan(nhiemVuId)));
    unawaited(queue.add(() => getLichSuPhanXuLy(nhiemVuId)));
    unawaited(queue.add(() => getYKienXuLyNhiemVu(nhiemVuId)));
    unawaited(queue.add(() => getDanhSachCongViecChiTietNhiemVu(nhiemVuId)));
    await queue.onComplete;
    showContent();
    queue.dispose();
  }

  Future<void> getChiTietNhiemVuCaNhan(String nhiemVuId) async {
    final result = await nhiemVuRepo.getChiTietNhiemVu(nhiemVuId, true);
    result.when(success: (res) {
      chiTietHeaderSubject.add(res);

    }, error: (error) {});
  }

  Future<void> getLichSuPhanXuLy(String nhiemVuId) async {
    final result = await nhiemVuRepo.getLichSuPhanXuLy(nhiemVuId);
    result.when(success: (res) {
      lichSuPhanXuLySubject.add(res);
    }, error: (error) {});
  }
  Future<void> getYKienXuLyNhiemVu(String nhiemVuId) async {
    final result = await nhiemVuRepo.getYKienXuLyNhiemVu(nhiemVuId);
    result.when(success: (res) {
      yKienXuLyNhiemVuSubject.add(res);
    }, error: (error) {});
  }
  Future<void> getDanhSachCongViecChiTietNhiemVu(String nhiemVuId) async {
    final result = await nhiemVuRepo.getDanhSachCongViecChiTietNhiemVu(nhiemVuId,true);
    result.when(success: (res) {
      danhsachCongViecSubject.add(res);
    }, error: (error) {});
  }

  List<LichSuThuHoiModel> fakeLSTH = [
    LichSuThuHoiModel(
      id: '',
      noiDungTraLai: 'Chưa có',
      thoiGian: '27/07/2021 | 17:02:22',
      donViBiThuHoi: 'UBND Đồng Nai',
      donViThuHoi: 'UBND Đồng Nai',
      nguoiBiThuHoi: 'Hà Kiều Anh',
      nguoiThuHoi: 'Hà Kiều Anh',
    ),
    LichSuThuHoiModel(
      id: '',
      noiDungTraLai: 'Chưa có',
      thoiGian: '27/07/2021 | 17:02:22',
      donViBiThuHoi: 'UBND Đồng Nai',
      donViThuHoi: 'UBND Đồng Nai',
      nguoiBiThuHoi: 'Hà Kiều Anh',
      nguoiThuHoi: 'Hà Kiều Anh',
    ),
  ];

  List<LichSuDonDocModel> fakeLSDD = [
    LichSuDonDocModel(
      id: '',
      noiDungDonDoc: 'Chưa có',
      thoiGian: '27/07/2021 | 17:02:22',
      donViDonDoc: 'UBND Đồng Nai',
      donViBiDonDoc: 'UBND Đồng Nai',
      nguoiBiDonDoc: 'Hà Kiều Anh',
      nguoiDonDoc: 'Hà Kiều Anh',
    ),
    LichSuDonDocModel(
      id: '',
      noiDungDonDoc: 'Chưa có',
      thoiGian: '27/07/2021 | 17:02:22',
      donViDonDoc: 'UBND Đồng Nai',
      donViBiDonDoc: 'UBND Đồng Nai',
      nguoiBiDonDoc: 'Hà Kiều Anh',
      nguoiDonDoc: 'Hà Kiều Anh',
    ),
    LichSuDonDocModel(
      id: '',
      noiDungDonDoc: 'Chưa có',
      thoiGian: '27/07/2021 | 17:02:22',
      donViDonDoc: 'UBND Đồng Nai',
      donViBiDonDoc: 'UBND Đồng Nai',
      nguoiBiDonDoc: 'Hà Kiều Anh',
      nguoiDonDoc: 'Hà Kiều Anh',
    ),
  ];

  List<LichSuCapNhatTHTHModel> fakeLSCNTHTH = [
    LichSuCapNhatTHTHModel(
      id: '',
      thoiGian: '27/07/2021 | 17:02:22',
      trangThai: 'DANG_THUC_HIEN',
      donViCapNhat: 'UBND Đồng Nai',
      dvBiTraLai: 'UBND Đồng Nai',
      nguoiCapNhat: 'chanhvpboqlvb',
      noiDungCapNhat: 'chanhvpboqlvb',
    ),
    LichSuCapNhatTHTHModel(
      id: '',
      thoiGian: '27/07/2021 | 17:02:22',
      trangThai: 'DANG_THUC_HIEN',
      donViCapNhat: 'UBND Đồng Nai',
      dvBiTraLai: 'UBND Đồng Nai',
      nguoiCapNhat: 'chanhvpboqlvb',
      noiDungCapNhat: 'chanhvpboqlvb',
    ),
  ];

  List<LichSuTraLaiModel> fakeLSTL = [
    LichSuTraLaiModel(
      id: '',
      nguoiCapNhat: 'chanhvpboqlvb',
      dvBiTraLai: 'UBND Đồng Nai',
      thoiGian: '27/07/2021 | 17:02:22',
      fileDinhKem: File('Mô tả dự án.docx'),
      donViTraLai: 'UBND Đồng Nai',
      nguoiBiTraLai: 'Hà Kiều Anh',
      noiDungTraLai: 'Chưa có',
    ),
  ];

  VanBanLienQuanModel fakeVBLQ = VanBanLienQuanModel(
    id: '',
    vanBanGiaoNV: [
      ItemVanBanLienQuanModel(
          id: '',
          ngayVB: '25/08/2021',
          fileDinhKem: File('Mô tả dự án.docx'),
          soKyHieu: '1',
          trichYeu: 'Thi hành khảo sát tình hình hộ nghèo năm 2021'),
      ItemVanBanLienQuanModel(
          id: '',
          ngayVB: '25/08/2021',
          fileDinhKem: File('Mô tả dự án.docx'),
          soKyHieu: '1',
          trichYeu: 'Thi hành khảo sát tình hình hộ nghèo năm 2021'),
      ItemVanBanLienQuanModel(
          id: '',
          ngayVB: '25/08/2021',
          fileDinhKem: File('Mô tả dự án.docx'),
          soKyHieu: '1',
          trichYeu: 'Thi hành khảo sát tình hình hộ nghèo năm 2021'),
    ],
    vanBanKhac: [],
  );

  void initChiTietNV() {
    vanBanLienQuanSubject.add(fakeVBLQ);
    lichSuCapNhatTHTHSubject.add(fakeLSCNTHTH);
    lichSuTraLaiSubject.add(fakeLSTL);
    lichSuThuHoiSubject.add(fakeLSTH);
    lichSuDonDocSubject.add(fakeLSDD);
  }
}
