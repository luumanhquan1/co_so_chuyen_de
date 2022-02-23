class DataLichLvModel {
  List<ListLichLVModel>? listLichLVModel;
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPage;

  DataLichLvModel(
      {this.listLichLVModel,
      this.pageIndex,
      this.pageSize,
      this.totalCount,
      this.totalPage});
}

class ListLichLVModel {
  String? id;

  String? title;

  String? content;

  int? status;

  String? location;

  bool? isLichLap;

  bool? isAllDay;

  int? trangThaiTheoUser;

  String? dateFrom;

  String? dateTo;

  String? timeFrom;

  String? timeTo;

  String? dateTimeFrom;

  String? dateTimeTo;

  String? createAt;

  String? color;

  String? typeSchedule;

  // CreateBys? createBys;
  //
  // CreateBys? canBoChuTri;

  ListLichLVModel({
    required this.id,
    required this.title,
    required this.content,
    required this.status,
    required this.location,
    required this.isLichLap,
    required this.isAllDay,
    required this.trangThaiTheoUser,
    required this.dateFrom,
    required this.dateTo,
    required this.timeFrom,
    required this.timeTo,
    required this.dateTimeFrom,
    required this.dateTimeTo,
    required this.createAt,
    required this.color,
    required this.typeSchedule,
    // required this.createBys,
    // required this.canBoChuTri,
  });
}

class CreateBys {
  String? id;

  String? chucVu;

  String? chucVuId;

  String? hoTen;

  String? sdtDiDong;

  String? donViId;

  String? tenDonVi;

  String? donViGocId;

  String? tenDonViGoc;

  CreateBys({
    required this.id,
    required this.chucVu,
    required this.chucVuId,
    required this.hoTen,
    required this.sdtDiDong,
    required this.donViId,
    required this.tenDonVi,
    required this.donViGocId,
    required this.tenDonViGoc,
  });
}