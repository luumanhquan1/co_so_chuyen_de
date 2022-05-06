import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
@JsonSerializable()
abstract class UserModel with _$UserModel{

  factory UserModel({
    String? avatarUrl,
    String? userId,
    String? email,
    String? birthday,
    @Default(true) bool gender,
    String? nameDisplay,
    @Default(false) bool onlineFlag,
    String? createAt,
    String? updateAt
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}