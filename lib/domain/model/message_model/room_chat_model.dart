import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class RoomChatModel {
  String roomId;
  List<PeopleChat> peopleChats;
  int colorChart;
  bool isGroup;
  RoomChatModel(
      {required this.roomId,
      required this.peopleChats,
      required this.colorChart,required this.isGroup});

  List<PeopleChat> getPeople() {
    final data = peopleChats
        .where((element) => element.userId != PrefsService.getUserId());
    return data.toList();
  }

  factory RoomChatModel.fromJson(Map<String, dynamic> json) {
    final data = <PeopleChat>[];
    if (json['people_chat'] != null) {
      json['people_chat'].forEach((v) {
        data.add(PeopleChat.fromJson(v));
      });
    }
    return RoomChatModel(
        roomId: json['room_id'] ?? '',
        peopleChats: data,
        colorChart: json['color_chart'] ?? 0, isGroup: json['is_group'] ?? false);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['room_id'] = roomId;
    data['color_chart'] = colorChart;
    data['people_chat'] = peopleChats.map((e) => e.toJson()).toList();
    data['is_group'] = isGroup;
    return data;
  }
}

class PeopleChat {
  final String userId;
  final String avatarUrl;
  final String nameDisplay;
  final String bietDanh;
  PeopleChat(
      {required this.userId,
      required this.avatarUrl,
      required this.nameDisplay,
      required this.bietDanh});
  factory PeopleChat.fromJson(Map<String, dynamic> json) {
    return PeopleChat(
        userId: json['user_id'] ?? '',
        avatarUrl: json['avatar_url'] ?? '',
        nameDisplay: json['name_display'] ?? '',
        bietDanh: json['biet_danh'] ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    return data;
  }
}
