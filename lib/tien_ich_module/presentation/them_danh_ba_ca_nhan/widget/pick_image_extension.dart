import 'package:ccvc_mobile/presentation/edit_personal_information/bloc/pick_media_file.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_ba_dien_tu/bloc_danh_ba_dien_tu/bloc_danh_ba_dien_tu_cubit.dart';
import 'package:ccvc_mobile/utils/extensions/map_extension.dart';

extension PickImageExtension on DanhBaDienTuCubit {
  Future<String> pickAvatar() async {
    final resultMap = await pickImageFunc(tittle: 'Pick avatar');
    final _path = resultMap.stringValueOrEmpty(PATH_OF_FILE);
    return _path;
  }
}
