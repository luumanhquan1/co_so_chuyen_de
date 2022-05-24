class RoomChatModel {
  final String roomId;
  final List<PeopleChat> peopleChats;
  final int colorChart;

  RoomChatModel(
      {required this.roomId,
      required this.peopleChats,
      required this.colorChart});
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
