import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/bloc/nhiem_vu_cubit.dart';
import 'package:ccvc_mobile/nhiem_vu_module/presentation/nhiem_vu/ui/mobile/bloc/danh_sach_cubit.dart';
import 'package:flutter/material.dart';

class NhiemVuProvider extends InheritedWidget {
  final DanhSachCubit cubit;

//  final ScrollController controller;
  const NhiemVuProvider({
    Key? key,
    required this.cubit,
    required Widget child,
    //  required this.controller,
  }) : super(key: key, child: child);

  static NhiemVuProvider of(BuildContext context) {
    final NhiemVuProvider? result =
        context.dependOnInheritedWidgetOfExactType<NhiemVuProvider>();
    assert(result != null, 'No element');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
