import 'dart:io';

import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/chi_tiet_nhiem_vu_header.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/danh_sach_cong_viec.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/van_ban_lien_quan.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/bloc/chi_tiet_nv_state.dart';
import 'package:rxdart/rxdart.dart';

class ChiTietNVCubit extends BaseCubit<ChiTietNVState> {
  ChiTietNVCubit() : super(ChiTietNVInitial());

  BehaviorSubject<ChiTietNhiemVuHeader> chiTietHeaderSubject =
      BehaviorSubject();

  BehaviorSubject<VanBanLienQuanModel> vanBanLienQuanSubject =
      BehaviorSubject();

BehaviorSubject<List<DanhSachCongViecModel>> danhsachCongViecSubject =
      BehaviorSubject();

  Stream<VanBanLienQuanModel> get vanBanLienQuanStream =>
      vanBanLienQuanSubject.stream;


  Stream<List<DanhSachCongViecModel>> get danhSachCongViecStream =>
      danhsachCongViecSubject.stream;

  Stream<ChiTietNhiemVuHeader> get chiTietHeaderStream =>
      chiTietHeaderSubject.stream;

  ChiTietNhiemVuHeader fakeHeader = ChiTietNhiemVuHeader(
      id: '',
      loaiNV: 'Nhiệm vụ cá nhân',
      soNhiemVu: 'NVBV8',
      tinhHinhTH: '13/10/2021',
      hanXuLy: 'NVBV8',
      nguoiGiao: 'Lương Minh Trang',
      noiDung: 'Nhiệm vụ hành chính giao');

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

  List<DanhSachCongViecModel> fakeDSCV = [
    DanhSachCongViecModel(
      id: '',
      donViXuLy: 'UBND Tỉnh Đồng Nai',
      hanXuLy: '25/08/2021',
      ndCongViec: 'Chưa có',
      nguoiGiaoViec: 'Nguyễn Kiều Oanh',
      nguoiXuLy: 'Lương Minh Trang',
      stt: 1,
      thoiGianGiaoViec: '25/08/2021',
      trangThai: 'QUA_HAN',
    ),
    DanhSachCongViecModel(
      id: '',
      donViXuLy: 'UBND Tỉnh Đồng Nai',
      hanXuLy: '25/08/2021',
      ndCongViec: 'Chưa có',
      nguoiGiaoViec: 'Nguyễn Kiều Oanh',
      nguoiXuLy: 'Lương Minh Trang',
      stt: 1,
      thoiGianGiaoViec: '25/08/2021',
      trangThai: 'QUA_HAN',
    ),
    DanhSachCongViecModel(
      id: '',
      donViXuLy: 'UBND Tỉnh Đồng Nai',
      hanXuLy: '25/08/2021',
      ndCongViec: 'Chưa có',
      nguoiGiaoViec: 'Nguyễn Kiều Oanh',
      nguoiXuLy: 'Lương Minh Trang',
      stt: 1,
      thoiGianGiaoViec: '25/08/2021',
      trangThai: 'QUA_HAN',
    ),
    DanhSachCongViecModel(
      id: '',
      donViXuLy: 'UBND Tỉnh Đồng Nai',
      hanXuLy: '25/08/2021',
      ndCongViec: 'Chưa có',
      nguoiGiaoViec: 'Nguyễn Kiều Oanh',
      nguoiXuLy: 'Lương Minh Trang',
      stt: 1,
      thoiGianGiaoViec: '25/08/2021',
      trangThai: 'QUA_HAN',
    ),
    DanhSachCongViecModel(
      id: '',
      donViXuLy: 'UBND Tỉnh Đồng Nai',
      hanXuLy: '25/08/2021',
      ndCongViec: 'Chưa có',
      nguoiGiaoViec: 'Nguyễn Kiều Oanh',
      nguoiXuLy: 'Lương Minh Trang',
      stt: 1,
      thoiGianGiaoViec: '25/08/2021',
      trangThai: 'CHUA_THUC_HIEN',
    ),
    DanhSachCongViecModel(
      id: '',
      donViXuLy: 'UBND Tỉnh Đồng Nai',
      hanXuLy: '25/08/2021',
      ndCongViec: 'Chưa có',
      nguoiGiaoViec: 'Nguyễn Kiều Oanh',
      nguoiXuLy: 'Lương Minh Trang',
      stt: 1,
      thoiGianGiaoViec: '25/08/2021',
      trangThai: 'QUA_HAN',
    ),
  ];

  void initChiTietNV() {
    chiTietHeaderSubject.add(fakeHeader);
    vanBanLienQuanSubject.add(fakeVBLQ);
    danhsachCongViecSubject.add(fakeDSCV);
  }
}
