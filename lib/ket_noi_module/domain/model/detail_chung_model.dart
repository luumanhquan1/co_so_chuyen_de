class DetailChungModel {
  String? id;
  String? tenSuKien;
  String? noiDungSuKien;
  List<LoaiSuKien>? loaiSuKien;
  String? thoiGianBatDau;
  String? diaChi;
  String? danhSachHinhAnh;
  bool? isPublish;
  String? contactInfo;

  DetailChungModel({
    this.id,
    this.tenSuKien,
    this.noiDungSuKien,
    this.loaiSuKien,
    this.thoiGianBatDau,
    this.diaChi,
    this.danhSachHinhAnh,
    this.isPublish,
    this.contactInfo,
  });
}

String subString(String textConten) {
  if (textConten.contains('.') == true) {
    final String text = textConten.split('.').first;
    return text;
  }
  return textConten;
}

String subStringLast(String textConten) {
  if (textConten.contains('.') == true) {
    final List<String> list = textConten.split('.');
    list.remove(
      textConten.split('.').first,
    );
    return list.toString().substring(1, list.toString().length - 1);
  }
  return '';
}

class LoaiSuKien {
  String? id;
  String? tenCategory;

  LoaiSuKien({required this.id, required this.tenCategory});
}
