import 'dart:convert';

import 'package:ccvc_mobile/domain/model/account/user_infomation.dart';
String dataUserToJson(DataUser data)  => json.encode(data.toJson());
class DataUser {
  String? username;
  String? userId;
  UserInformation? userInformation;
  String? accessToken;
  String? refreshToken;

  DataUser({
    this.username,
    this.userId,
    this.userInformation,
    this.accessToken,
    this.refreshToken,
  });

  DataUser.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userId = json['userId'];
    userInformation = json['userInformation'] != null
        ? UserInformation.fromJson(json['userInformation'])
        : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = username;
    data['userId'] = userId;
    if (userInformation != null) {
      data['userInformation'] = userInformation!.toJson();
    }
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
