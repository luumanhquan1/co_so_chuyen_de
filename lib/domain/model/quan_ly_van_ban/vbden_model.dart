import 'package:json_annotation/json_annotation.dart';

class VBDenModel {
  List<DataVBDen>? listVBDen = [];

  VBDenModel({this.listVBDen});
}
@JsonSerializable()
class DataVBDen {
  @JsonKey(name: 'Id')
  String? id = '';
  @JsonKey(name: 'Code')
  String? code = '';
  @JsonKey(name: 'Value')
  int? value = 0;
  DataVBDen({this.id, this.code, this.value});
}
