import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/vbden_model.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/vbdi_model.dart';

mixin QLVBRepository {
  // Future<Result<VBDenModel>> getVBDen(
  //     String startTime, String endTime,);

  Future<Result<VBDiModel>> getVBDi(
      String startTime, String endTime,);
}
