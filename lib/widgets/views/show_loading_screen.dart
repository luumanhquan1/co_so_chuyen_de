import 'package:ccvc_mobile/widgets/dialog/cupertino_loading.dart';
import 'package:ccvc_mobile/widgets/dialog/message_dialog/message_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowLoadingScreen {
  static final OverlayEntry _overlayEntry = _showLoading();
  static void show() {
    final OverlayState? overlayState = Overlay.of(MessageConfig.contextConfig!);
    overlayState?.insert(_overlayEntry);
  }

  static void dismiss() {
    _overlayEntry.remove();
  }

  static OverlayEntry _showLoading() {
    return OverlayEntry(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.3),
          body: const Center(child: CupertinoLoading()),
        );
      },
    );
  }
}
