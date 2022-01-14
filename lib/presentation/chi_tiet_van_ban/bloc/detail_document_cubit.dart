import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/detail_doccument/detail_document.dart';
import 'package:rxdart/rxdart.dart';
import 'datai_doccument_state.dart';
import 'package:file_picker/file_picker.dart';

class DetailDocumentCubit extends BaseCubit<DetailDocumentState> {
  DetailDocumentCubit() : super(DetailDocumentInitial());

  BehaviorSubject<DetailDocumentModel> detailDocumentSubject =
      BehaviorSubject<DetailDocumentModel>();

  Stream<DetailDocumentModel> get streamDetaiMission =>
      detailDocumentSubject.stream;


  List<String> listIdFile = [];
  List<String> listIdFileReComment = [];

  void removeFileIndex(int index, bool isReComment) {
    if (isReComment) {
      listIdFileReComment.removeAt(index);
    } else {
      listIdFile.removeAt(index);
    }
  }

  Future<void> uploadFileDocument(
      List<PlatformFile> files, bool isReComment) async {
    // service.uploadFileDocument(listFile: files).then((response) {
    //   final listFile = response.data ?? [];
    //   if (isReComment) {
    //     for (var i = 0; i < listFile.length; i++) {
    //       listIdFileReComment.add(listFile[i]);
    //     }
    //   } else {
    //     for (var i = 0; i < listFile.length; i++) {
    //       listIdFile.add(listFile[i]);
    //     }
    //   }
    // });
  }
}
