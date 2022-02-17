import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/document/incoming_document.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/van_ban_model.dart';
import 'package:ccvc_mobile/domain/repository/qlvb_repository/qlvb_repository.dart';
import 'package:ccvc_mobile/presentation/incoming_document/bloc/incoming_document_state.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:rxdart/rxdart.dart';

class IncomingDocumentCubit extends BaseCubit<IncomingDocumentState> {
  IncomingDocumentCubit() : super(IncomingDocumentStateIntial());

  final BehaviorSubject<List<VanBanModel>> _getListVBDen =
  BehaviorSubject<List<VanBanModel>>();

  Stream<List<VanBanModel>> get getListVbDen => _getListVBDen.stream;
  void callAPi() {
    listDataVBDen();
  }
  final QLVBRepository _QLVBRepo = Get.find();
  Future<void> listDataVBDen() async {
    List<VanBanModel> listVbDen=[];
    final result = await _QLVBRepo.getVanBanModel();
    result.when(
      success: (res) {
        listVbDen=res.pageDataRespone?.map((e) => e.toDomain()).toList() ?? [];
        _getListVBDen.sink.add(listVbDen);
      },
      error: (err) {
        return err;
      },
    );

  }


  List<IncomingDocument> listIncomingDocument = [
    IncomingDocument(
        'Thượng khẩn',
        'V/v kết nối, liên thông phần mềm QLVB drtgdfgdf',
        '2022-01-11T00:00:00',
        'Hà Kiều Anh'),
    IncomingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    IncomingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    IncomingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    IncomingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
  ];
}
