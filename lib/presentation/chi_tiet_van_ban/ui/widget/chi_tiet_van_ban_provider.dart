import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/bloc/detail_document_cubit.dart';
import 'package:flutter/material.dart';

class ChiTietVanBanProvider extends InheritedWidget {
  final DetailDocumentCubit chiTietVanBanCubit;

  const ChiTietVanBanProvider({
    Key? key,
    required this.chiTietVanBanCubit,
    required Widget child,
  }) : super(key: key, child: child);

  static ChiTietVanBanProvider of(BuildContext context) {
    final ChiTietVanBanProvider? result =
        context.dependOnInheritedWidgetOfExactType<ChiTietVanBanProvider>();
    assert(result != null, 'No element');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
