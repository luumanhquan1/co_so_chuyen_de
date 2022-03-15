import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/tien_ich_module/data/service/tien_ich_service.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/danh_sach_title_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/tien_ich_repository.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/topic_hdsd_response.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/danh_sach_hssd_response.dart';

class TienIchRepositoryImpl implements TienIchRepository {
  final TienIchService _tienIchService;

  TienIchRepositoryImpl(this._tienIchService);

  @override
  Future<Result<List<TopicHDSD>>> getTopicHDSD() {
    return runCatchingAsync<DataTopicHDSDResponse, List<TopicHDSD>>(
      () => _tienIchService.getTopicHDSD(),
      (response) => response.data?.map((e) => e.toModel()).toList() ?? [],
    );
  }

  @override
  Future<Result<DataDanhSachTitleHDSD>> getDanhSachHDSD(
      int pageIndex, int pageSize,String topicId, String type, String searchKeyword) {
    return runCatchingAsync<DataDanhSachHDSDResponse, DataDanhSachTitleHDSD>(
        () => _tienIchService.getDanhSachHDSD(
            pageIndex, pageSize, topicId, type, searchKeyword),
        (response) =>
            response.data?.toModel() ?? DataDanhSachTitleHDSD.empty());
  }
}
