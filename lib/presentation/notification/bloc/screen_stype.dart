enum ScreenType { COMMENT, LIKE, FRIEND_REQUEST }

extension ScreenTypeExtension on ScreenType {
  String getTitle({int countLike = 0}) {
    switch (this) {
      case ScreenType.FRIEND_REQUEST:
        return ' đã gửi đến bạn lời mời kết bạn.';
      case ScreenType.COMMENT:
        return ' đã bình luận bài viết của bạn.';
      case ScreenType.LIKE:
        return ' và $countLike người khác đã gửi đến bạn lời mời kết bạn.';
    }
  }
}
