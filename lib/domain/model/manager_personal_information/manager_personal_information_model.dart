import 'package:ccvc_mobile/presentation/manager_personal_information/ui/items/manager_personal_information_row.dart';

class ManagerPersonalInformationModel {
  String? hoten;
  String? ma;
  String? thutu;
  String? ngaysinh;
  String? cmnd;
  String? gioitinh;
  String? email;

  //
  String? sdtCoQuan;
  String? sdtLienHe;
  String? tinhThanhPho;
  String? quanHuyen;
  String? phuongXa;
  String? diaChiLienHe;

  //
  String? stt;
  String? donVi;
  String? chuVu;
  String? trangThai;
  bool? macDinh;

//
  String? tenDangNhap;
  String? ungDung;

  ManagerPersonalInformationModel({
    this.hoten,
    this.ma,
    this.thutu,
    this.ngaysinh,
    this.cmnd,
    this.gioitinh,
    this.email,
    this.sdtCoQuan,
    this.sdtLienHe,
    this.tinhThanhPho,
    this.quanHuyen,
    this.phuongXa,
    this.diaChiLienHe,
    this.stt,
    this.donVi,
    this.chuVu,
    this.trangThai,
    this.macDinh,
    this.tenDangNhap,
    this.ungDung,
  });

  static ManagerPersonalInformationModel fakeData =
      ManagerPersonalInformationModel(
    hoten: 'Cao Tiến Dũng',
    ma: 'dungct',
    thutu: '1',
    ngaysinh: '13/12/1970',
    cmnd: '123456789',
    gioitinh: 'Nam',
    email: 'dunct@gmail.com',
    sdtCoQuan: '0888888888',
    sdtLienHe: '0123456778',
    tinhThanhPho: 'Hà nội',
    quanHuyen: 'Cầu giấy',
    phuongXa: 'Duy Tân',
    diaChiLienHe: 'Số 9 , ngõ 4',
    stt: '1',
    donVi: 'UBND tỉnh Đồng nai',
    chuVu: 'Văn thư',
    tenDangNhap: 'lamls',
    ungDung:
        'Ứng dụng app điều hành Quản lý văn bản Ứng dụng họp Văn phòng điện tử Ứng dụng quản lý nhiệm vụ Phản ánh kiến nghị',
    trangThai: 'Hoạt động',
    macDinh: true,
  );

  List<ManagerPersonalInformationRow> toListMobile() {
    final List<ManagerPersonalInformationRow> list = [
      ManagerPersonalInformationRow('Họ và tên', hoten, TypeRow.text),
      ManagerPersonalInformationRow('Mã cán bộ', ma, TypeRow.text),
      ManagerPersonalInformationRow('Thứ tự', thutu, TypeRow.text),
      ManagerPersonalInformationRow('Ngày sinh', ngaysinh, TypeRow.text),
      ManagerPersonalInformationRow('Số cmnd', cmnd, TypeRow.text),
      ManagerPersonalInformationRow('Giới tính', gioitinh, TypeRow.text),
      ManagerPersonalInformationRow('Email', email, TypeRow.text),
      ManagerPersonalInformationRow('SĐT cơ quan', sdtCoQuan, TypeRow.text),
      ManagerPersonalInformationRow('SĐT liên hệ', sdtLienHe, TypeRow.text),
      ManagerPersonalInformationRow(
          'Tỉnh/Thành phố', tinhThanhPho, TypeRow.text),
      ManagerPersonalInformationRow('Quận/Huyện', quanHuyen, TypeRow.text),
      ManagerPersonalInformationRow('Phường/Xã', phuongXa, TypeRow.text),
      ManagerPersonalInformationRow(
          "Địa chỉ liên hệ", diaChiLienHe, TypeRow.text),
    ];
    return list;
  }

  List<ManagerPersonalInformationRow> toListRowDetailJob() {
    final List<ManagerPersonalInformationRow> list = [
      ManagerPersonalInformationRow('Họ và tên', hoten, TypeRow.text),
      ManagerPersonalInformationRow('Mã cán bộ', ma, TypeRow.text),
      ManagerPersonalInformationRow('Thứ tự', thutu, TypeRow.text),
      ManagerPersonalInformationRow('Ngày sinh', ngaysinh, TypeRow.text),
      ManagerPersonalInformationRow('Số cmnd', cmnd, TypeRow.text),
      ManagerPersonalInformationRow('Giới tính', gioitinh, TypeRow.text),
      ManagerPersonalInformationRow('Email', email, TypeRow.text),
    ];
    return list;
  }

  List<ManagerPersonalInformationRow> toListAdress() {
    final List<ManagerPersonalInformationRow> list = [
      ManagerPersonalInformationRow('SĐT cơ quan', sdtCoQuan, TypeRow.text),
      ManagerPersonalInformationRow('SĐT liên hệ', sdtLienHe, TypeRow.text),
      ManagerPersonalInformationRow(
          'Tỉnh/Thành phố', tinhThanhPho, TypeRow.text),
      ManagerPersonalInformationRow('Quận/Huyện', quanHuyen, TypeRow.text),
      ManagerPersonalInformationRow('Phường/Xã', phuongXa, TypeRow.text),
      ManagerPersonalInformationRow(
          "Địa chỉ liên hệ", diaChiLienHe, TypeRow.text),
    ];

    return list;
  }

  List<ManagerPersonalInformationRow> toListDonVi() {
    final List<ManagerPersonalInformationRow> list = [
      ManagerPersonalInformationRow('STT', stt, TypeRow.text),
      ManagerPersonalInformationRow('Đơn vị', donVi, TypeRow.text),
      ManagerPersonalInformationRow('Chức vụ', chuVu, TypeRow.text),
      ManagerPersonalInformationRow('Trạng Thái', trangThai, TypeRow.status),
      ManagerPersonalInformationRow('Mặc định', macDinh, TypeRow.checkbox),
    ];
    return list;
  }

  List<ManagerPersonalInformationRow> toListUngDung() {
    final List<ManagerPersonalInformationRow> list = [
      ManagerPersonalInformationRow('STT', stt, TypeRow.text),
      ManagerPersonalInformationRow('Tên đăng nhập', tenDangNhap, TypeRow.text),
      ManagerPersonalInformationRow('Ứng dụng', ungDung, TypeRow.text),
      ManagerPersonalInformationRow('Trạng Thái', trangThai, TypeRow.status),
    ];
    return list;
  }
}
