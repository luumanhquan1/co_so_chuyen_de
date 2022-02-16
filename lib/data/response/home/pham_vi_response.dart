import 'package:json_annotation/json_annotation.dart';

class PhamViResponse{
  @JsonKey(name:'chucVu')
  String? chucVu;
  @JsonKey(name:'chucVuId')
  String? chucVuId;

}