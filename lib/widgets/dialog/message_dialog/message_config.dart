import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/widgets/dialog/message_dialog/mess_dialog_pop_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
enum MessState {error,success}
class MessageConfig {
  static BuildContext? _context;
  static void init(BuildContext context) {
    if (_context != null) {
      return;
    }
    _context = context;
  }

  static void show() {
    final OverlayState? overlayState = Overlay.of(_context!);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return MessageDialogPopup(
          onDismiss: () {
            overlayEntry.remove();
          },
          urlIcon: ImageAssets.ic_delete_do,
          title: 'Thay đổi thành công',
        );
      },
    );

    overlayState?.insert(overlayEntry);
  }
}
