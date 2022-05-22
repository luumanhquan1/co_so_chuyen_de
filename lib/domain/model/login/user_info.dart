import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:hive/hive.dart';

part 'user_info.g.dart';

@HiveType(typeId: 0)
class UserInfoModel {
  @HiveField(0)
  String? userId;
  @HiveField(1)
  String? avataUrl;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? birthday;
  @HiveField(4)
  bool? gender;
  @HiveField(5)
  String? nameDisplay;
  @HiveField(6)
  String? createAt;
  @HiveField(7)
  String? updateAt;

  UserInfoModel({
    required this.userId,
    required this.avataUrl,
    required this.email,
    required this.birthday,
    required this.gender,
    required this.nameDisplay,
    required this.createAt,
    required this.updateAt,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'avataUrl': avataUrl,
        'email': email,
        'birthday': birthday,
        'gender': gender,
        'nameDisplay': nameDisplay,
        'createAt': createAt,
        'updateAt': updateAt,
      };

  UserInfoModel.empty();
}
