
import 'dart:developer';

class UserModel {
  String? avatarUrl;
  String? userId;
  String? email;
  int? birthday;
  bool? gender;
  String? nameDisplay;
  bool? onlineFlag;
  int? createAt;
  int? updateAt;

  UserModel(
      {this.avatarUrl,
      this.userId,
      this.email,
      this.birthday,
      this.gender,
      this.nameDisplay,
      this.onlineFlag,
      this.createAt,
      this.updateAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    log(json['avatar_url'] ?? 'cccccccccccccccccc');
    log('aaaaaaaaaaaaaaaaa'+json.toString());
    nameDisplay = json['name_display'] as String?;
    gender = json['gender'] as bool?;
    onlineFlag = json['online_flag'] as bool?;
    email = json['email'] as String?;
    createAt = json['create_at'] as int?;
    updateAt = json['update_at'] as int?;
    avatarUrl = json['avatar_url'] as String?;
    userId = json['user_id'] as String?;
    birthday = json['bỉthday'] as int?;
  }
  Map<String, dynamic> PostModelToJson(UserModel instance) => <String, dynamic>{
        'email': instance.email,
        'user_id': instance.userId,
        'avatar_url': instance.avatarUrl,
        'gender': instance.gender,
        'name_display': instance.nameDisplay,
        'create_at': instance.createAt,
        'update_at': instance.updateAt,
        'online_flag': instance.onlineFlag,
        'birthday': instance.birthday
      };
}
