import 'dart:io';

import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/chi_tiet_nhiem_vu_header.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_nhiem_vu/van_ban_lien_quan.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_nhiem_vu/bloc/chi_tiet_nv_state.dart';
import 'package:rxdart/rxdart.dart';

class ChiTietNVCubit extends BaseCubit<ChiTietNVState> {
  ChiTietNVCubit() : super(ChiTietNVInitial());

  BehaviorSubject<ChiTietNhiemVuHeader> chiTietHeaderSubject =
      BehaviorSubject();

  BehaviorSubject<VanBanLienQuanModel> vanBanLienQuanSubject =
      BehaviorSubject();

  Stream<VanBanLienQuanModel> get vanBanLienQuanStream =>
      vanBanLienQuanSubject.stream;

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

  void initChiTietNV() {
    chiTietHeaderSubject.add(fakeHeader);
    vanBanLienQuanSubject.add(fakeVBLQ);
  }
}
