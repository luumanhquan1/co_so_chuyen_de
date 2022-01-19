import 'package:ccvc_mobile/domain/model/search/bao_chi_mang_xa_hoi_model.dart';
import 'package:ccvc_mobile/domain/model/search/tong_hop_nv_model.dart';
import 'package:ccvc_mobile/domain/model/search/van_ban_di_model.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';

VanBanDiModel vanBanDiModel = VanBanDiModel(
  time: 'Cá nhân - Hôm nay',
  listDocument: FakeData.documentList,
);

VanBanDiModel yKienNguoiDan = VanBanDiModel(
  time: 'Cá nhân - Hôm nay',
  listDocument: FakeData.documentList,
);

BaoChiMangXaHoiModel baoChiMangXaHoi = BaoChiMangXaHoiModel(
  time: 'Cá nhân - Hôm nay',
  listData: FakeData.fakeDataPress,
);

TongHopNVModel tongHopNVModel = TongHopNVModel(
  time: 'Cá nhân - Hôm nay',
  listData: FakeData.listNhiemView,
);

TongHopNVModel lichLamViec = TongHopNVModel(
  time: 'Cá nhân - Hôm nay',
  listData: FakeData.caledar,
);

TongHopNVModel lichHop = TongHopNVModel(
  time: 'Cá nhân - Hôm nay',
  listData: FakeData.caledar,
);
