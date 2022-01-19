enum TypeProcessJobProfiles { CAP_NHAT, TRA_LAI, PHAN_XU_LY }

// extension TypeHistoryAPI on TypeProcessJobProfiles {
//   String query() {
//     switch (this) {
//       case TypeProcessJobProfiles.CAP_NHAT:
//         return SharedUris.lich_su_cap_nhat_ho_so;
//       case TypeProcessJobProfiles.TRA_LAI:
//         return SharedUris.lich_su_tra_lai_ho_so;
//       case TypeProcessJobProfiles.PHAN_XU_LY:
//         return SharedUris.lich_su_phan_xu_ly_ho_so;
//     }
//   }
// }

class HistoryDetailDocument {
  late DataHistoryProcess nguoiTao;
  late DataHistoryProcess hanhDong;
  late DataHistoryProcess noiDung;
  late DataHistoryProcess thoiGian;
  late DataHistoryProcess tenCanBo;
  late DataHistoryProcess tenDonVi;
  late DataHistoryProcess donViBiTraLai;
  late DataHistoryProcess donViTraLai;
  late DataHistoryProcess nguoiBiTraLai;
  late DataHistoryProcess nguoiTraLai;
  late DataHistoryProcess actionPhanXuLy;
  late DataHistoryProcess idCanBoDuocPhanXuLy;
  late DataHistoryProcess idCanBoPhanXuLy;
  late DataHistoryProcess idDonViDuocPhanXuLy;
  late DataHistoryProcess idDonViPhanXuLy;
  late DataHistoryProcess tenCanBoDuocPhanXuLy;
  late DataHistoryProcess tenCanBoPhanXuLy;
  late DataHistoryProcess tenDonViDuocPhanXuLy;
  late DataHistoryProcess tenDonViPhanXuLy;
  int trangThai = 0;
  late DataHistoryProcess vaiTro;
  TypeProcessJobProfiles type = TypeProcessJobProfiles.CAP_NHAT;

  // List<AttachedFileInfo> listFileAttack;

  HistoryDetailDocument(// {required this.listFileAttack}
      );

  factory HistoryDetailDocument.fromJson(Map<String, dynamic> json,
      {required TypeProcessJobProfiles type}) {
    // final listFiles = json['FileDinhKems'] == null
    //     ? []
    //     : json['FileDinhKems'] as List<dynamic>;
    // final listAttack =
    // listFiles.map((e) => AttachedFileInfo.fromJson(e)).toList();
    final HistoryDetailDocument res = HistoryDetailDocument(
        // listFileAttack: listAttack
        );
    switch (type) {
      case TypeProcessJobProfiles.PHAN_XU_LY:
        {
          res.thoiGian = DataHistoryProcess('Thời gian', json['']);
          res.tenCanBoDuocPhanXuLy = DataHistoryProcess(
              'Người nhận', json['TenCanBoDuocPhanXuLy'].stripHtmlIfNeeded());
          res.tenCanBoPhanXuLy = DataHistoryProcess(
              'Người gửi', json['TenCanBoPhanXuLy'].stripHtmlIfNeeded());
          res.tenDonViDuocPhanXuLy = DataHistoryProcess(
              'Đơn vị nhận', json['TenDonViDuocPhanXuLy'].stripHtmlIfNeeded());
          res.tenDonViPhanXuLy = DataHistoryProcess(
              'Đơn vị nhận', json['TenDonViDuocPhanXuLy'].stripHtmlIfNeeded());
          res.actionPhanXuLy = DataHistoryProcess(
              'Thao tác', getTrangThaiHanhDongPXl(json['ActionPhanXuLy']));
          res.vaiTro = DataHistoryProcess(
              'Vai trò xử lý', getTrangThaiVaitro(json['VaiTro']));
          res.type = type;
          res.trangThai = json['TrangThai'];

          return res;
        }
      case TypeProcessJobProfiles.CAP_NHAT:
        {
          // res.hanhDong = DataHistoryProcess(
          //     'Hành động', getTrangThaiHanhDongPXl(json.intValue('HanhDong')));
          // res.noiDung = DataHistoryProcess('Nội dung',
          //     json.stringValueOrEmpty('NoiDung').stripHtmlIfNeeded().trim());
          // res.tenCanBo = DataHistoryProcess('Tên Cán Bộ',
          //     json.stringValueOrEmpty('TenCanBo').stripHtmlIfNeeded());
          // res.tenDonVi = DataHistoryProcess('Tên Đơn vị',
          //     json.stringValueOrEmpty('TenDonVi').stripHtmlIfNeeded());
          // res.thoiGian = DataHistoryProcess(
          //     'Thời gian',
          //     json
          //         .stringValueOrEmpty('ThoiGian')
          //         .toDate(DateFormatApp.dateBackEnd)
          //         .toDateString(DateFormatApp.date));
          // res.listFileAttack = listAttack;
          // res.type = type;
          return res;
        }
      case TypeProcessJobProfiles.TRA_LAI:
        {
          // res.donViBiTraLai = DataHistoryProcess('Đơn vị bị trả lại',
          //     json.stringValueOrEmpty('DonViBiTraLai').stripHtmlIfNeeded());
          // res.donViTraLai = DataHistoryProcess('Đơn vị bị trả lại',
          //     json.stringValueOrEmpty('DonViTraLai').stripHtmlIfNeeded());
          // res.nguoiBiTraLai = DataHistoryProcess('Người bị trả lại',
          //     json.stringValueOrEmpty('NguoiBiTraLai').stripHtmlIfNeeded());
          // res.nguoiTraLai = DataHistoryProcess('Người trả lại',
          //     json.stringValueOrEmpty('NguoiTraLai').stripHtmlIfNeeded());
          // res.noiDung = DataHistoryProcess('Nội dung',
          //     json.stringValueOrEmpty('NoiDung').stripHtmlIfNeeded().trim());
          // res.thoiGian = DataHistoryProcess(
          //     'Thời gian',
          //     json
          //         .stringValueOrEmpty('ThoiGian')
          //         .toDate(DateFormatApp.dateBackEnd)
          //         .toDateString(DateFormatApp.date));
          res.type = type;
          return res;
        }
    }
  }

  String getTextHeader() {
    switch (type) {
      case TypeProcessJobProfiles.CAP_NHAT:
        return tenCanBo.value;
      case TypeProcessJobProfiles.PHAN_XU_LY:
        return '';
      case TypeProcessJobProfiles.TRA_LAI:
        return '';
    }
  }

  List<DataHistoryProcess> toListRow() {
    if (type == TypeProcessJobProfiles.CAP_NHAT) {
      return [
        tenCanBo,
        tenDonVi,
        thoiGian,
        noiDung,
        hanhDong,
      ];
    } else if (type == TypeProcessJobProfiles.TRA_LAI) {
      return [
        nguoiTraLai,
        donViTraLai,
        nguoiBiTraLai,
        donViBiTraLai,
        thoiGian,
        noiDung
      ];
    } else {
      return [
        tenCanBoPhanXuLy,
        tenCanBoDuocPhanXuLy,
        tenDonViDuocPhanXuLy,
        actionPhanXuLy,
        vaiTro,
        thoiGian,
      ];
    }
  }

  static String getTrangThaiPXL(int trangThai) {
    //   switch (trangThai) {
    //     case Status.chuaThucHien:
    //       return 'Chưa thực hiện';
    //     case Status.dangThucHien:
    //       return 'Đang thực hiện';
    //     case Status.daHoanThanh:
    //       return 'Thu hồi';
    //     case Status.traLai:
    //       return 'Trả lại';
    //     case Status.thuHoi:
    //       return 'Thu hồi';
    //     case Status.huyHoanThanh:
    //       return 'Hủy hoàn thành';
    //     case Status.daPhanXuLy:
    //       return 'Đã phân xử lý';
    //   }
    return '';
  }

  static String getTrangThaiHanhDongPXl(int? trangThai) {
    //   switch (trangThai) {
    //     case TrangThaiActionPhanXuLy.phanXuLy:
    //       return 'Phân xử lý';
    //     case TrangThaiActionPhanXuLy.traLai:
    //       return 'Trả lại';
    //     case TrangThaiActionPhanXuLy.thuHoi:
    //       return 'Thu hồi';
    //     case TrangThaiActionPhanXuLy.xoaKhoiPhanXuLy:
    //       return 'Xóa khỏi phân xử lý';
    //     case TrangThaiActionPhanXuLy.capNhatVaiTroCuaPhanXuLy:
    //       return 'Cập nhật vai trò của phân xử lý';
    //     case TrangThaiActionPhanXuLy.ketThucHoSo:
    //       return 'Kết thúc hồ sơ';
    //     case TrangThaiActionPhanXuLy.moLaiHoSo:
    //       return 'Mở lại hồ sơ';
    //     case TrangThaiActionPhanXuLy.taoMoiHoSo:
    //       return 'Tạo mới hồ sơ';
    //     case TrangThaiActionPhanXuLy.capNhatHoSo:
    //       return 'Cập nhật hồ sơ';
    //     case TrangThaiActionPhanXuLy.duyetHoSo:
    //       return 'Duyệt hồ sơ';
    //   }
    return '';
  }

  static String getTrangThaiVaitro(int? trangThai) {
//   switch (trangThai) {
//     case TrangThaiVaiTroPhanXuLy.chuTri:
//       return 'Chủ trì';
//     case TrangThaiVaiTroPhanXuLy.phoiHop:
//       return 'Phối hợp';
//     case TrangThaiVaiTroPhanXuLy.nhanDeBiet:
//       return 'Nhận để biết';
//     case TrangThaiVaiTroPhanXuLy.lanhDaoGiaoViec:
//       return 'Lãnh đạo giao việc';
//     case TrangThaiVaiTroPhanXuLy.giaoViecCap1:
//       return 'Giao việc cấp một';
//     case TrangThaiVaiTroPhanXuLy.lanhDaoTheoDoi:
//       return 'Lãnh đạo theo dõi';
//     case TrangThaiVaiTroPhanXuLy.xuLyChinh:
//       return 'Xử lý chính';
//     case TrangThaiVaiTroPhanXuLy.phoiHopXuLy:
//       return 'Phối hợp xử lý';
//     case TrangThaiVaiTroPhanXuLy.theoDoi:
//       return 'Theo dõi';
//     case TrangThaiVaiTroPhanXuLy.nguoiTao:
//       return 'Người tạo';
//   }
    return '';
  }
}

class DataHistoryProcess {
  String title = '';
  String value = '';

// van ban di
  // theo doi vb da ban hanh
  // bool isTrangThaiDaBanHanh() {
  //   return title == tr('lichsu_trangthai_guivb') ||
  //       title == tr('lichsu_trangthai_xuly');
  // }

  DataHistoryProcess(this.title, this.value);
}

class HistoryProcessPage {
  //Ho so cong viec
  List<HistoryDetailDocument> listDetailDocumentHistory = [];

  // List<History>
  int totalPage = 0;

  HistoryProcessPage(
      {required this.totalPage, required this.listDetailDocumentHistory});

  factory HistoryProcessPage.getListHistoryjobProfiles(
      Map<String, dynamic> data,
      {required TypeProcessJobProfiles type}) {
    final pageData = data['PageData'] as List<dynamic>;
    final List<HistoryDetailDocument> historyDetailDocument = pageData
        .map((json) => HistoryDetailDocument.fromJson(json, type: type))
        .toList();
    return HistoryProcessPage(
      totalPage: data['TotalPage'],
      listDetailDocumentHistory: historyDetailDocument,
    );
  }
}
