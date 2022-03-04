class DataLichSuVanBanModel {
  String? messages;
  List<LichSuVanBanModel>? data;
  String? validationResult;
  bool? isSuccess;

  DataLichSuVanBanModel({
    this.messages,
    this.data,
    this.validationResult,
    this.isSuccess,
  });
}

class LichSuVanBanModel {
  String? nguoiTaoXuLy;
  String? donViTaoXuLy;
  String? thoiGianTao;
  String? noiDung;
  String? nguoiXuLy;
  String? donViXuLy;
  List<FileDinhKems>? fileDinhKems;
  String? hoatDong;

  LichSuVanBanModel({
    this.nguoiTaoXuLy,
    this.donViTaoXuLy,
    this.thoiGianTao,
    this.noiDung,
    this.nguoiXuLy,
    this.donViXuLy,
    this.fileDinhKems,
    this.hoatDong,
  });
}

class FileDinhKems {
  String? id;
  String? idFileGoc;
  String? processId;
  String? ten;
  String? duongDan;
  String? duoiMoRong;
  String? dungLuong;
  String? kieuDinhKem;
  bool? isSign;
  String? qrCreated;
  int? index;
  String? nguoiTaoId;
  String? nguoiTao;
  String? pathIOC;

  FileDinhKems({
    this.id,
    this.idFileGoc,
    this.processId,
    this.ten,
    this.duongDan,
    this.duoiMoRong,
    this.dungLuong,
    this.kieuDinhKem,
    this.isSign,
    this.qrCreated,
    this.index,
    this.nguoiTaoId,
    this.nguoiTao,
    this.pathIOC,
  });
}
