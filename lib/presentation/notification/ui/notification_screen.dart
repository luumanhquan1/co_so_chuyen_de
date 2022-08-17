import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/notify/notification_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/notification/bloc/notification_cubit.dart';
import 'package:ccvc_mobile/presentation/notification/ui/widget/item_notify.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:ccvc_mobile/widgets/dialog/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationCubit cubit = NotificationCubit();

  @override
  void initState() {
    super.initState();
    cubit.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: S.current.thong_bao,
        actions: [
          GestureDetector(
            onTap: () {
              showDiaLogCustom(
                context,
                title: 'Thông báo',
                textContent:
                    'Bạn có chắc muốn đọc toàn bộ thông báo không không ?',
                btnRightTxt: 'Xác nhận',
                btnLeftTxt: 'Đóng',
                funcBtnRight: () {
                  Navigator.pop(context, '');
                },
              );
            },
            child: SvgPicture.asset(ImageAssets.icReadAll),
          ),
          spaceW15,
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<NotificationModel>>(
          stream: cubit.listNotificationSubject.stream,
          builder: (context, snapshot) {
            final data = snapshot.data ?? [];
            return Column(
              children: data
                  .map(
                    (e) => ItemNotificationWidget(
                      model: e,
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
