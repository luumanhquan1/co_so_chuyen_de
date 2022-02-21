import 'package:ccvc_mobile/widgets/dialog/message_dialog/mess_dialog_pop_up.dart';
import 'package:flutter/cupertino.dart';

class MessageConfig {
  static BuildContext? _context;
  static void init(BuildContext context) {
    if (_context != null) {
      return;
    }
    _context = context;
  }

  static void show() {
    final entry = OverlayEntry(
      builder: (context) {
        return MessageDialogPopup();
      },
    );
    Overlay.of(_context!)?.insert(entry);
  }
}
