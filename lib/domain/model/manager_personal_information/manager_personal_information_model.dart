import 'package:ccvc_mobile/domain/model/edit_personal_information/user_accounts.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/manager_personal_information_row.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';

class ManagerPersonalInformationModel {
//   String? hoten;
//   String? ma;
//   String? thutu;
//   String? ngaysinh;
//   String? cmnd;
//   String? gioitinh;
//   String? email;
//
//   //
//   String? sdtCoQuan;
//   String? sdtLienHe;
//   String? tinhThanhPho;
//   String? quanHuyen;
//   String? phuongXa;
//   String? diaChiLienHe;
//
//   //
//   String? stt;
//   String? donVi;
//   String? chuVu;
//   String? trangThai;
//   bool? macDinh;
//
// //
//   String? tenDangNhap;
//   String? ungDung;

  //
  String? id;
  String? maCanBo;
  String? hoTen;
  String? phoneDiDong;
  String? phoneCoQuan;
  String? phoneNhaRieng;
  String? email;
  bool? gioiTinh;
  String? ngaySinh;
  String? iDDonViHoatDong;
  String? cmtnd;
  String? anhDaiDienFilePath;
  String? anhChuKyFilePath;
  String? anhChuKyNhayFilePath;
  String? thoiGianCapNhat;
  String? chucVu;
  String? donVi;

  //bool? bitThuTruongDonVi;
  // bool? bitDauMoiPAKN;
  String? diaChi;
  int? thuTu;
  int? iThuTu;
  String? tinh;
  String? huyen;
  String? xa;
  bool? isDefault;
  String? trangThai;
  String? ungDung;

  ManagerPersonalInformationModel({
    this.id,
    this.maCanBo,
    this.hoTen,
    this.phoneDiDong,
    this.phoneCoQuan,
    this.phoneNhaRieng,
    this.email,
    this.gioiTinh,
    this.ngaySinh,
    this.iDDonViHoatDong,
    this.cmtnd,
    this.anhDaiDienFilePath,
    this.anhChuKyFilePath,
    this.anhChuKyNhayFilePath,
    this.thoiGianCapNhat,
    this.chucVu,
    this.donVi,
    //  this.bitThuTruongDonVi,
    //  this.bitDauMoiPAKN,
    this.diaChi,
    this.thuTu,
    this.iThuTu,
    this.tinh,
    this.huyen,
    this.xa,
    this.isDefault,
    this.trangThai,
    this.ungDung,
  }); // List<UserAccounts>? userAccounts;

  static ManagerPersonalInformationModel fakeData =
      ManagerPersonalInformationModel(
    id: 'a',
    maCanBo: '123',
    hoTen: 'luc',
    phoneDiDong: '01234567689',
    phoneCoQuan: '0123456789',
    phoneNhaRieng: '01234346567',
    email: 'luc@gmail.com',
    gioiTinh: false,
    ngaySinh: '2001-04-01',
    iDDonViHoatDong: 'a',
    cmtnd: '1234567890',
    anhDaiDienFilePath: 'a',
    anhChuKyFilePath: 'a',
    anhChuKyNhayFilePath: 'a',
    thoiGianCapNhat: 'a',
    chucVu: 'bi thu',
    donVi: 'lanh dao',
    //   bitThuTruongDonVi: 'a',
    //   bitDauMoiPAKN: 'a',
    diaChi: 'lam loi',
    thuTu: 2,
    iThuTu: 3,
    tinh: 'a',
    huyen: 'a',
    xa: 'a',
    isDefault: false,
    trangThai: "Hoạt động",
    ungDung: 'a',
  );

  List<ManagerPersonalInformationRow> toListMobile() {
    final List<ManagerPersonalInformationRow> list = [
      ManagerPersonalInformationRow('Họ và tên', hoTen, TypeRow.text),
      ManagerPersonalInformationRow('Mã cán bộ', maCanBo, TypeRow.text),
      ManagerPersonalInformationRow('Thứ tự', thuTu, TypeRow.text),
      ManagerPersonalInformationRow('Ngày sinh', ngaySinh, TypeRow.text),
      ManagerPersonalInformationRow('Số cmnd', cmtnd, TypeRow.text),
      ManagerPersonalInformationRow('Giới tính', gioiTinh, TypeRow.text),
      ManagerPersonalInformationRow('Email', email, TypeRow.text),
      ManagerPersonalInformationRow('SĐT cơ quan', phoneCoQuan, TypeRow.text),
      ManagerPersonalInformationRow('SĐT liên hệ', phoneDiDong, TypeRow.text),
      ManagerPersonalInformationRow(
        'Tỉnh/Thành phố',
        tinh,
        TypeRow.text,
      ),
      ManagerPersonalInformationRow('Quận/Huyện', huyen, TypeRow.text),
      ManagerPersonalInformationRow('Phường/Xã', xa, TypeRow.text),
      ManagerPersonalInformationRow(
        'Địa chỉ liên hệ',
        diaChi,
        TypeRow.text,
      ),
    ];
    return list;
  }

  List<ManagerPersonalInformationRow> toListRowDetailJob() {
    final List<ManagerPersonalInformationRow> list = [
      ManagerPersonalInformationRow('Họ và tên', hoTen, TypeRow.text),
      ManagerPersonalInformationRow('Mã cán bộ', maCanBo, TypeRow.text),
      ManagerPersonalInformationRow('Thứ tự', thuTu, TypeRow.text),
      ManagerPersonalInformationRow('Ngày sinh', ngaySinh, TypeRow.text),
      ManagerPersonalInformationRow('Số cmnd', cmtnd, TypeRow.text),
      ManagerPersonalInformationRow('Giới tính', gioiTinh, TypeRow.text),
      ManagerPersonalInformationRow('Email', email, TypeRow.text),
    ];
    return list;
  }

  List<ManagerPersonalInformationRow> toListAdress() {
    final List<ManagerPersonalInformationRow> list = [
      ManagerPersonalInformationRow('SĐT cơ quan', phoneCoQuan, TypeRow.text),
      ManagerPersonalInformationRow('SĐT liên hệ', phoneDiDong, TypeRow.text),
      ManagerPersonalInformationRow(
        'Tỉnh/Thành phố',
        tinh,
        TypeRow.text,
      ),
      ManagerPersonalInformationRow('Quận/Huyện', huyen, TypeRow.text),
      ManagerPersonalInformationRow('Phường/Xã', xa, TypeRow.text),
      ManagerPersonalInformationRow(
        'Địa chỉ liên hệ',
        diaChi,
        TypeRow.text,
      ),
    ];

    return list;
  }

  List<ManagerPersonalInformationRow> toListDonVi() {
    final List<ManagerPersonalInformationRow> list = [
      ManagerPersonalInformationRow('STT', thuTu, TypeRow.text),
      ManagerPersonalInformationRow('Đơn vị', donVi, TypeRow.text),
      ManagerPersonalInformationRow('Chức vụ', chucVu, TypeRow.text),
      ManagerPersonalInformationRow('Trạng Thái', trangThai, TypeRow.status),
      ManagerPersonalInformationRow('Mặc định', isDefault, TypeRow.checkbox),
    ];
    // if (trangThai == 1) {
    //   list.add(
    //     ManagerPersonalInformationRow(
    //       'Trạng Thái',
    //       'Hoạt động',
    //       TypeRow.status,
    //     ),
    //   );
    // } else {
    //   list.add(
    //     ManagerPersonalInformationRow(
    //       'Trạng Thái',
    //       'Không hoạt động',
    //       TypeRow.status,
    //     ),
    //   );
    // }
    return list;
  }

  List<ManagerPersonalInformationRow> toListUngDung() {
    final List<ManagerPersonalInformationRow> list = [
      ManagerPersonalInformationRow('STT', thuTu, TypeRow.text),
      ManagerPersonalInformationRow('Tên đăng nhập', hoTen, TypeRow.text),
      ManagerPersonalInformationRow('Ứng dụng', ungDung, TypeRow.list),
      ManagerPersonalInformationRow('Trạng Thái', trangThai, TypeRow.status),
    ];
    // if (trangThai == 1) {
    //   list.add(
    //     ManagerPersonalInformationRow(
    //       'Trạng Thái',
    //       'Hoạt động',
    //       TypeRow.status,
    //     ),
    //   );
    // } else {
    //   list.add(
    //     ManagerPersonalInformationRow(
    //       'Trạng Thái',
    //       'Không hoạt động',
    //       TypeRow.status,
    //     ),
    //   );
    // }
    return list;
  }

  Map<String, dynamic> getInfoToMap() {
    return {
      'id': id ?? '',
      'Họ và Tên': hoTen ?? '',
      'Mã cán bộ': maCanBo ?? '',
      'Thứ tự': thuTu ?? 0,
      'Ngày sinh':
          DateTime.parse(ngaySinh ?? '').toStringWithFormat.replaceAll(' ', ''),
      'Số CMND': cmtnd ?? '',
      'Giới tính': gioiTinh ?? false ? 'Nam' : 'Nu',
      'Email': email ?? '',
      'Số điện thoại cơ quan': phoneCoQuan ?? '',
      'Số điện thoại': phoneDiDong ?? '',
      'Tỉnh/Thành phố':
          DateTime.parse(ngaySinh ?? '').toStringWithFormat.replaceAll(' ', ''),
      'Quận/Huyện':
          DateTime.parse(ngaySinh ?? '').toStringWithFormat.replaceAll(' ', ''),
      'Phường/Xã':
          DateTime.parse(ngaySinh ?? '').toStringWithFormat.replaceAll(' ', ''),
      'Địa chỉ liên hệ': diaChi ?? '',
    };
  }
}
