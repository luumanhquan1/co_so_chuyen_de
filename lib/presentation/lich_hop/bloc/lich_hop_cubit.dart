import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_state.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:intl/intl.dart';

class LichHopCubit extends BaseCubit<LichHopState> {
  LichHopCubit() : super(LichHopStateIntial());
  List<String> listImageLichHopCuaToi = [
    ImageAssets.icLichCongTacTrongNuoc,
    ImageAssets.lichCanKlch,
    ImageAssets.lichSapToi,
    ImageAssets.icLichCongTacNuocNgoai,
  ];

  dynamic currentTime = DateFormat.yMMMEd().format(DateTime.now());
}
