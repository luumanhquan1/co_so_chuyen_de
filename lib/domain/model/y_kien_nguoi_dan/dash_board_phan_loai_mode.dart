class PhanLoaiModel {
  List<PhanLoaiDataModel> listPhanLoai;

  PhanLoaiModel({required this.listPhanLoai});
}

class PhanLoaiDataModel {
  int soLuong;
  String status;

  PhanLoaiDataModel({required this.soLuong, required this.status});
}
