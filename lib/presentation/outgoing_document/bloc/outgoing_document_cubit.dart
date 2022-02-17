import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/document/incoming_document.dart';
import 'package:ccvc_mobile/domain/model/document/outgoing_document.dart';
import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/van_ban_model.dart';
import 'package:ccvc_mobile/domain/repository/qlvb_repository/qlvb_repository.dart';
import 'package:ccvc_mobile/presentation/incoming_document/bloc/incoming_document_state.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class OutgoingDocumentCubit extends BaseCubit<IncomingDocumentState> {
  OutgoingDocumentCubit() : super(IncomingDocumentStateIntial());

  final BehaviorSubject<List<VanBanModel>> _getListVBDi =
      BehaviorSubject<List<VanBanModel>>();

  Stream<List<VanBanModel>> get getListVbDi => _getListVBDi.stream;

  void callAPi() {
    listDataVBDi(
      startDate: '2022-01-13',
      endDate: '2022-02-18',
      index: 1,
      size: 10,
    );
  }

  final QLVBRepository _QLVBRepo = Get.find();

  Future<void> listDataVBDi({
    required String startDate,
    required String endDate,
    required int index,
    required int size,
  }) async {
    List<VanBanModel> listVbDi = [];
    final result =
        await _QLVBRepo.getDanhSachVbDi(startDate, endDate, index, size);
    result.when(
      success: (res) {
        listVbDi=res.pageDataRespone??[];
        _getListVBDi.sink.add(listVbDi);
      },
      error: (err) {
        return err;
      },
    );

  }

  List<OutgoingDocument> listIncomingDocument = [
    OutgoingDocument(
        'Thượng khẩn',
        'V/v kết nối, liên thông phần mềm QLVB drtgdfgdf',
        '2022-01-11T00:00:00',
        'Hà Kiều Anh'),
    OutgoingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    OutgoingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    OutgoingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    OutgoingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    OutgoingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    OutgoingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    OutgoingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    OutgoingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    OutgoingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
    OutgoingDocument('Thượng khẩn', 'V/v kết nối, liên thông phần mềm QLVB',
        '2022-01-11T00:00:00', 'Hà Kiều Anh'),
  ];
}
