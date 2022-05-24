import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class UserInfoModel {
  @HiveField(0)
  String? userId;
  @HiveField(1)
  String? avatarUrl;
  @HiveField(2)
  String? email;
  @HiveField(3)
  int? birthday;
  @HiveField(4)
  bool? gender;
  @HiveField(5)
  String? nameDisplay;
  @HiveField(6)
  int? createAt;
  @HiveField(7)
  int? updateAt;

  UserInfoModel({
    required this.userId,
    required this.avatarUrl,
    required this.email,
    required this.birthday,
    required this.gender,
    required this.nameDisplay,
    required this.createAt,
    required this.updateAt,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    avatarUrl = json['avatar_url'];
    gender = json['gender'];
    userId = json['user_id'];
    nameDisplay = json['name_display'];
    updateAt = json['update_at'];

    createAt = json['create_at'];
    email = json['email'];
  }
  UserInfoModel.empty();
}
