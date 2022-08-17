import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/notify/notification_model.dart';
import 'package:ccvc_mobile/presentation/notification/bloc/screen_stype.dart';
import 'package:rxdart/rxdart.dart';

import 'notification_state.dart';

class NotificationCubit extends BaseCubit<NotificationState> {
  NotificationCubit() : super(NotificationStateInitial());

  BehaviorSubject<List<NotificationModel>> listNotificationSubject =
      BehaviorSubject.seeded([]);

  List<NotificationModel> fakeData = [
    NotificationModel(
      name: 'Nguyễn Đăng Hùng',
      detailId: '0000-0000-0000-0000',
      screenType: ScreenType.FRIEND_REQUEST,
      createBy: DateTime.now(),
      isRead: false,
    ),
    NotificationModel(
      name: 'Lưu Mạnh Quân',
      detailId: '0000-0000-0000-0000',
      screenType: ScreenType.LIKE,
      createBy: DateTime.now(),
      isRead: true,
    ),
    NotificationModel(
      name: 'Trần Trúc Diệp',
      detailId: '0000-0000-0000-0000',
      screenType: ScreenType.COMMENT,
      createBy: DateTime.now(),
      isRead: false,
    ),
  ];

  void initData() {
    listNotificationSubject.add(fakeData);
  }
}
