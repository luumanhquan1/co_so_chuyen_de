import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_sach_title_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/detail_huong_dan_su_dung.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';

mixin TienIchRepository {

  Future<Result<List<TopicHDSD>>> getTopicHDSD();

  Future<Result<DataDanhSachTitleHDSD>> getDanhSachHDSD(
      int pageIndex,
      int pageSize ,
      String topicId,
      String type,
      String searchKeyword,
      );
  Future<Result<DetailHuongDanSuDung>> getDetailHuongDanSuDung(
      String id,
      );
}
