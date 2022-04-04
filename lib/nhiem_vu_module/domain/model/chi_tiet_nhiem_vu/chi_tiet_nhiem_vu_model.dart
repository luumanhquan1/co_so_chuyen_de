class ChiTietNhiemVuModel {
  String? id;
  String? processTypeId;
  String? statusCode;
  String? statusName;
  String? statusId;
  String? taskId;
  String? processTypeName;
  String? processTypeCode;
  String? processCode;
  String? nguoiTaoId;
  String? hanXuLy;
  String? nguoiGiao;
  String? hanXuLyVPCP;
  String? processContent;
  Metadata? metadata;
  bool? coTheSua;
  bool? coTheXoa;
  bool? coTheDonDoc;
  bool? coTheThuHoi;
  bool? coTheTraLai;
  bool? coTheCapNhatTinhHinhThucHien;
  bool? coThePhanXuLy;

  ChiTietNhiemVuModel({
    this.id,
    this.processTypeId,
    this.statusCode,
    this.statusName,
    this.statusId,
    this.taskId,
    this.processTypeName,
    this.processTypeCode,
    this.processCode,
    this.nguoiTaoId,
    this.hanXuLy,
    this.nguoiGiao,
    this.hanXuLyVPCP,
    this.processContent,
    this.metadata,
    this.coTheSua,
    this.coTheXoa,
    this.coTheDonDoc,
    this.coTheThuHoi,
    this.coTheTraLai,
    this.coTheCapNhatTinhHinhThucHien,
    this.coThePhanXuLy,
  });
}

class Metadata {
  String? donViTaoId;
  String? daGuiVPCP;
  String? donViTheoDoi;
  String? nguoiGiao;
  String? nguoiGiaoId;
  String? nguoiTheoDoi;

  Metadata({
    this.donViTaoId,
    this.daGuiVPCP,
    this.donViTheoDoi,
    this.nguoiGiao,
    this.nguoiGiaoId,
    this.nguoiTheoDoi,
  });
}
