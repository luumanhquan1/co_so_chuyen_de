import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class DashBroashNhiemVu {
  DataModel? data;

  DashBroashNhiemVu({this.data});
}

class DataModel {
  List<LoaiNhiemVuComomModel>? loaiNhiemVu;
  List<LoaiNhiemVuComomModel>? trangThai;
  List<LoaiNhiemVuComomModel>? trangThaiXuLy;

  DataModel({
    this.loaiNhiemVu,
    this.trangThai,
    this.trangThaiXuLy,
  });
}

class LoaiNhiemVuComomModel {
  String? id;
  String? giaTri;
  String? text;
  int? value;
  bool? isDonVi;
  String? typeCode;
  Color? color;

  LoaiNhiemVuComomModel({
    this.id,
    this.giaTri,
    required this.text,
    required this.value,
    this.isDonVi,
    this.typeCode,
    this.color,
  });
}

List<LoaiNhiemVuComomModel> listFakeData = [
  LoaiNhiemVuComomModel(text: S.current.qua_han, value: 0),
  LoaiNhiemVuComomModel(text: S.current.den_han, value: 0),
  LoaiNhiemVuComomModel(text: S.current.trong_han, value: 0)
];
