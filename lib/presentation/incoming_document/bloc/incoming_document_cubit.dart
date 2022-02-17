import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/document/incoming_document.dart';
import 'package:ccvc_mobile/domain/repository/qlvb_repository/qlvb_repository.dart';
import 'package:ccvc_mobile/presentation/incoming_document/bloc/incoming_document_state.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class IncomingDocumentCubit extends BaseCubit<IncomingDocumentState> {
  IncomingDocumentCubit() : super(IncomingDocumentStateIntial());

  final BehaviorSubject<List<IncomingDocument>> _getListVBDen =
  BehaviorSubject<List<IncomingDocument>>();

  Stream<List<IncomingDocument>> get getListVbDen => _getListVBDen.stream;
  void callAPi() {
    listDataVBDen();
  }
  final QLVBRepository _QLVBRepo = Get.find();
  Future<void> listDataVBDen() async {
    List<IncomingDocument> listVbDen=[];
    final result = await _QLVBRepo.getDanhSachVbDen();
    result.when(
      success: (res) {
        for (final element in res.listBVanBan!.danhSachVB!) {
          listVbDen.add(element.toDomainVanBan());
        }
      },
      error: (err) {
        return err;
      },
    );
    _getListVBDen.sink.add(listVbDen);
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
