import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tat_ca_chu_de/thong_ke_tuong_tac.dart';

class BaoCaoTinTuc {
  int id = 0;
  String name = '';
  ThongKeTuongTac interaction_statistic = ThongKeTuongTac.Empty();

  BaoCaoTinTuc.Empty();

  BaoCaoTinTuc(
      {required this.id,
      required this.name,
      required this.interaction_statistic});

  factory BaoCaoTinTuc.fromJson(Map<String, dynamic> json) {
    return BaoCaoTinTuc(
        id: json['id'],
        name: json['name'],
        interaction_statistic:
            ThongKeTuongTac.fromJson(json['interaction_statistic']));
  }
}
