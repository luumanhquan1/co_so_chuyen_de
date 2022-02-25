import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/data/request/lich_hop/kien_nghi_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/them_y_kien_hop_request.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/chi_tiet_lich_hop_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/chuong_trinh_hop.dart';
import 'package:ccvc_mobile/domain/repository/lich_hop/hop_repository.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/bloc/chi_tiet_lich_hop_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class DetailMeetCalenderCubit extends BaseCubit<DetailMeetCalenderState> {
  DetailMeetCalenderCubit() : super(DetailMeetCalenderInitial());

  HopRepository get hopRp => Get.find();

  //
  BehaviorSubject<ChiTietLichHopModel> chiTietLichLamViecSubject =
      BehaviorSubject();

  BehaviorSubject<ChuongTrinhHopModel> danhSachCanBoTPTGSubject =
      BehaviorSubject();

  final BehaviorSubject<String> _themBieuQuyet = BehaviorSubject<String>();

  Stream<String> get themBieuQuyet => _themBieuQuyet.stream;

  Stream<ChiTietLichHopModel> get chiTietLichLamViecStream =>
      chiTietLichLamViecSubject.stream;

  Stream<ChuongTrinhHopModel> get danhSachCanBoTPTGStream =>
      danhSachCanBoTPTGSubject.stream;

  List<String> cacLuaChonBieuQuyet = [];

  void addValueToList(String value) {
    cacLuaChonBieuQuyet.add(value);
  }

  void removeTag(String value) {
    cacLuaChonBieuQuyet.remove(value);
  }

  Future<void> initData() async {
    final result =
        await hopRp.getChiTietLichHop('8bbd89ee-57fb-4f41-a6f9-06aa86fa4377');
    result.when(
        success: (res) {
          chiTietLichLamViecSubject.add(res);
        },
        error: (err) {});
  }

  Future<void> danhSachCanBoTPTG({required String id}) async {
    final result = await hopRp.getDanhSachCanBoTPTG(id);

    result.when(
      success: (value) {
        danhSachCanBoTPTGSubject.add(value);
      },
      error: (error) {},
    );
  }

  Future<void> soLuongPhatBieuData() async {
    final result =
        await hopRp.getSoLuongPhatBieu('8bbd89ee-57fb-4f41-a6f9-06aa86fa4377');
    result.when(success: (res) {}, error: (err) {});
  }

  ListPerSon fakeDataListPerson() {
    final ListPerSon fakeDataListPersona = ListPerSon(
        tongSoNguoi: 8,
        soNguoiDongY: 3,
        soNguoiChoXacNhan: 5,
        listPerson: listFake);
    return fakeDataListPersona;
  }

  List<Person> listFake = [
    Person(
      name: 'Nguyễn Minh Hoàng',
      isConnect: true,
      color: Colors.blue,
    ),
    Person(
      name: 'Nguyễn Minh Hoàng',
      isConnect: true,
      color: Colors.blue,
    ),
    Person(
      name: 'Nguyễn Minh Hoàng',
      isConnect: true,
      color: Colors.blue,
    ),
    Person(
      name: 'Hoàng Mai Linh',
      isConnect: false,
      color: Colors.red,
    ),
    Person(
      name: 'Hoàng Mai Linh',
      isConnect: false,
      color: Colors.red,
    ),
    Person(
      name: 'Hoàng Mai Linh',
      isConnect: false,
      color: Colors.red,
    ),
    Person(
      name: 'Hoàng Mai Linh',
      isConnect: false,
      color: Colors.red,
    ),
    Person(
      name: 'Hoàng Mai Linh',
      isConnect: false,
      color: Colors.red,
    ),
  ];

  List<String> fakeDataDropdown = ['item 1', 'item 2', 'item 3'];
  final HopRepository _hopRepo = Get.find();

  Future<void> getTongPhienHop() async {
    final result =
        await _hopRepo.getTongPhienHop('f6b9aae0-23b1-497d-8096-866c964f2e17');
    result.when(
      success: (res) {

      },
      error: (err) {
        return;
      },
    );
  }

  Future<void> selectPhienHop() async {
    final result =
        await _hopRepo.getTongPhienHop('f6b9aae0-23b1-497d-8096-866c964f2e17');
    result.when(
      success: (res) {
      },
      error: (err) {
        return;
      },
    );
  }

  final HopRepository _HopRepo = Get.find();

  Future<void> themYKien() async {
    ThemYKienRequest themYKienRequest = ThemYKienRequest(
        content: 'them y kien',
        scheduleId: 'ab675c7d-fb86-4ec1-806f-5308b0f97af1');
    final result = await _HopRepo.themYKienHop(themYKienRequest);
    result.when(
      success: (res) {},
      error: (err) {
        return;
      },
    );
  }

  Future<void> themBieuQuyetHop() async {
    final BieuQuyetRequest bieuQuyetRequest = BieuQuyetRequest(
        dateStart:'01/01/1900',
        lichHopId: 'ab675c7d-fb86-4ec1-806f-5308b0f97af1',
        loaiBieuQuyet: false,
        noiDung: 'noi dung',
        quyenBieuQuyet: true,
        thoiGianBatDau: '1900-01-01T09:55',
        thoiGianKetThuc: '1900-01-01T10:30',
        trangThai: 0,
        danhSachLuaChon:[DanhSachLuaChon(
          tenLuaChon: 'gio tay',
          mauBieuQuyet: 'primary',
        )],
      danhSachThanhPhanThamGia: [DanhSachThanhPhanThamGia(
          canBoId: '39227131-3db7-48f8-a1b2-57697430cc69',
          donViId: '0bf3b2c3-76d7-4e05-a587-9165c3624d76',
          idPhienhopCanbo: '904c6a02-1540-4768-8b72-db8aa3aabb8d',
      )]

    );
    final result = await _HopRepo.themBieuQuyet(bieuQuyetRequest);
    result.when(
      success: (res) {
      },
      error: (err) {
        return;
      },
    );
  }


void dispose() {}
}
