import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/data/request/lich_hop/moi_hop_request.dart';
import 'package:ccvc_mobile/data/request/lich_hop/them_y_kien_hop_request.dart';
import 'package:ccvc_mobile/domain/locals/hive_local.dart';
import 'package:ccvc_mobile/domain/model/chi_tiet_lich_lam_viec/chi_tiet_lich_lam_viec_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/chi_tiet_lich_hop_model.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/chuong_trinh_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/danh_sach_phat_bieu_lich_hop.dart';
import 'package:ccvc_mobile/domain/model/lich_hop/moi_hop.dart';
import 'package:ccvc_mobile/domain/repository/lich_hop/hop_repository.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_lich_hop/bloc/chi_tiet_lich_hop_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class DetailMeetCalenderCubit extends BaseCubit<DetailMeetCalenderState> {
  DetailMeetCalenderCubit() : super(DetailMeetCalenderInitial());

  HopRepository get hopRp => Get.find();

  //

  BehaviorSubject<List<MoiHopModel>> listMoiHopSubject = BehaviorSubject();

  Stream<List<MoiHopModel>> get listMoiHopStream => listMoiHopSubject.stream;

  BehaviorSubject<ChiTietLichHopModel> chiTietLichLamViecSubject =
      BehaviorSubject();

  BehaviorSubject<ChuongTrinhHopModel> danhSachCanBoTPTGSubject =
      BehaviorSubject();

  BehaviorSubject<DanhSachPhatBieuLichHopModel>
      danhSachPhatbieuLichHopModelSubject = BehaviorSubject();

  Stream<DanhSachPhatBieuLichHopModel> get danhSachPhatbieuLichHopStream =>
      danhSachPhatbieuLichHopModelSubject.stream;

  Stream<ChiTietLichHopModel> get chiTietLichLamViecStream =>
      chiTietLichLamViecSubject.stream;

  Stream<ChuongTrinhHopModel> get danhSachCanBoTPTGStream =>
      danhSachCanBoTPTGSubject.stream;

  final BehaviorSubject<String> _themBieuQuyet = BehaviorSubject<String>();

  Stream<String> get themBieuQuyet => _themBieuQuyet.stream;

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
      error: (err) {},
    );
  }

  Future<void> postMoiHop({
    required String lichHopId,
    // required bool IsMultipe,
    // required bool isSendMail,
    // required List<MoiHopRequest> body,
  }) async {
    final result = await hopRp.postMoiHop(
      lichHopId,
      false,
      true,
      [
        MoiHopRequest(
          CanBoId: '4da4b3a3-0d1f-41f8-a70d-dc6c48904747',
          DonViId: '43c679ab-149f-4017-afd5-a6401ff60616',
          VaiTroThamGia: 2,
          chucVu: 'Giám đốc sở',
          hoTen: 'Trần Vũ Hoài Hạ',
          id: null,
          status: 0,
          tenDonVi: 'Sở Kế hoạch và Đầu tư',
          type: 1,
          userId: '4da4b3a3-0d1f-41f8-a70d-dc6c48904747',
        ),
      ],
    );

    result.when(
      success: (value) {
        listMoiHopSubject.add(value);
      },
      error: (error) {},
    );
  }

  void getDanhSachPhatBieu() {
    getDanhSachPhatBieuLichHop('e908def0-e519-4f3b-b9c7-ef841ef15331');
    getDanhSachBieuQuyetLichHop('e908def0-e519-4f3b-b9c7-ef841ef15331');
  }

  Future<void> getDanhSachPhatBieuLichHop(String lichHopId) async {
    final result = await hopRp.getDanhSachPhatBieuLichHop(lichHopId);
    result.when(success: (res) {}, error: (err) {});
  }

  Future<void> getDanhSachBieuQuyetLichHop(String id) async {
    final result = await hopRp.getDanhSachBieuQuyetLichHop(id);
    result.when(success: (res) {}, error: (err) {});
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
    ListPerSon fakeDataListPersona = ListPerSon(
      tongSoNguoi: 8,
      soNguoiDongY: 3,
      soNguoiChoXacNhan: 5,
      listPerson: listFake,
    );
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

  List<String> fakeDataDropdown = ["item 1", "item 2", "item 3"];
  final HopRepository _hopRepo = Get.find();

  Future<void> getTongPhienHop() async {
    final result =
        await _hopRepo.getTongPhienHop('f6b9aae0-23b1-497d-8096-866c964f2e17');
    result.when(
      success: (res) {},
      error: (err) {
        return;
      },
    );
  }

  Future<void> selectPhienHop() async {
    final result =
        await _hopRepo.getTongPhienHop('f6b9aae0-23b1-497d-8096-866c964f2e17');
    result.when(
      success: (res) {},
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

  void dispose() {}
}
