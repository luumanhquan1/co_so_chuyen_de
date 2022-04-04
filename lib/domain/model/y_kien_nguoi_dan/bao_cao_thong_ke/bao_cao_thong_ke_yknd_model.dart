class ThongKeYKNDData {
  int choTiepNhan;
  int daXuLy;
  int dangTaiCongKhai;
  int dangXuLy;
  int soLuongYKien;

  ThongKeYKNDData({
    required this.choTiepNhan,
    required this.daXuLy,
    required this.dangTaiCongKhai,
    required this.dangXuLy,
    required this.soLuongYKien,
  });
}

class ThongKeYKNDModel {
  ThongKeYKNDData thongKeYKNDData;

  ThongKeYKNDModel({required this.thongKeYKNDData});
}

class DashBoardBaoCaoYKNDData {
  String code;
  String name;
  int soLuong;

  DashBoardBaoCaoYKNDData(
      {required this.code, required this.name, required this.soLuong,});
}

class DashBoardBaoCaoYKNDModel {
  List<DashBoardBaoCaoYKNDData> listDataDashBoard;

  DashBoardBaoCaoYKNDModel({required this.listDataDashBoard});
}
