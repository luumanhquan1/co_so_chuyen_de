import 'package:ccvc_mobile/data/result/result.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/topic_hdsd.dart';

mixin TienIchRepository {

  Future<Result<List<TopicHDSD>>> getTopicHDSD();
}
