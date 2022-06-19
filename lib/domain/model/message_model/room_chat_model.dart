import 'package:ccvc_mobile/domain/locals/prefs_service.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class RoomChatModel {
  final String roomId;
  final List<PeopleChat> peopleChats;
  final int colorChart;

  RoomChatModel(
      {required this.roomId,
      required this.peopleChats,
      required this.colorChart});
  PeopleChat getPeople() {
    final data = peopleChats
        .where((element) => element.userId != PrefsService.getUserId());
    if (data.isNotEmpty) {

      return data.first;
    }
    return PeopleChat(userId: '', avatarUrl: '', nameDisplay: '', bietDanh: '');
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
}
