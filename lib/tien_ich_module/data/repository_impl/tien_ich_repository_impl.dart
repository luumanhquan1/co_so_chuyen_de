import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/tien_ich_module/data/service/tien_ich_service.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/repository/tien_ich_repository.dart';
import 'package:ccvc_mobile/tien_ich_module/data/response/topic_hdsd_response.dart';

class TienIchRepositoryImpl implements TienIchRepository {
  final TienIchService _tienIchService;

  TienIchRepositoryImpl(this._tienIchService);

  @override
  Future<Result<List<TopicHDSD>>> getTopicHDSD() {
    return runCatchingAsync<DataTopicHDSDResponse, List<TopicHDSD>>(
        () => _tienIchService.getTopicHDSD(),
        (response) => response.data?.map((e) => e.toModel()).toList() ??[],);
  }
}
