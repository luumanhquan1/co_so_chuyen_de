class FriendModel {
  String userId1 = '';
  String userId2 = '';
  int type = 1;
  FriendModel.fromJson(Map<String, dynamic> json) {
    userId1 = json['user_id1'] ?? '';
    userId2 = json['user_id2'] ?? '';
    type = json['type'] ?? 1;
  }
}
