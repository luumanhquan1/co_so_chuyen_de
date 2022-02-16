import 'package:ccvc_mobile/data/response/quan_ly_van_ban/data_vbden_response.dart';

class VBDenModel {
  List<DataVBDenResponse>? listVBDen = [];
  VBDenModel({this.listVBDen});
}
class DataVBDen {
  String? id = '';
  String? code = '';
  int? value = 0;
  DataVBDen({this.id, this.code, this.value});
}
