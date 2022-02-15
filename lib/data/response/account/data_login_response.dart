import 'package:ccvc_mobile/domain/model/account/data_user.dart';
import 'package:ccvc_mobile/domain/model/account/user_infomation.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_login_response.g.dart';

@JsonSerializable()
class DataLoginResponse extends Equatable {
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'userId')
  String? userId;
  @JsonKey(name: 'userInformation')
  dynamic userInformation;
  @JsonKey(name: 'accessToken')
  String? accessToken;
  @JsonKey(name: 'refreshToken')
  String? refreshToken;

  DataLoginResponse();

  factory DataLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$DataLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataLoginResponseToJson(this);

  DataUser toDomainDataUser() => DataUser(
        username: username,
        userId: userId,
        userInformation: UserInformation.fromJson(userInformation),
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
