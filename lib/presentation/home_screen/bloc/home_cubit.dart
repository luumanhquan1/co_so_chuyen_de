import 'package:ccvc_mobile/domain/model/home/document_model.dart';
import 'package:ccvc_mobile/domain/model/home/tinh_huong_khan_cap_model.dart';
import 'package:ccvc_mobile/domain/model/user_infomation_model.dart';
import 'package:ccvc_mobile/presentation/home_screen/fake_data.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/home_item.dart';
import 'package:rxdart/rxdart.dart';

class HomeCubit {
  final BehaviorSubject<HomeItemType?> _showDialogSetting =
      BehaviorSubject<HomeItemType?>();
  final BehaviorSubject<List<TinhHuongKhanCapModel>> _tinhHuongKhanCap =
      BehaviorSubject<List<TinhHuongKhanCapModel>>();
  final BehaviorSubject<UserInformationModel> _userInformation =
      BehaviorSubject<UserInformationModel>();
  final BehaviorSubject<DocumentDashboardModel> _getDocumentVBDen =
      BehaviorSubject<DocumentDashboardModel>();
  final BehaviorSubject<DocumentDashboardModel> _getDocumentVBDi =
      BehaviorSubject<DocumentDashboardModel>();

  void _getTinhHuongKhanCap() {
    _tinhHuongKhanCap.sink.add(FakeData.tinhKhanCap);
  }

  void showDialog(HomeItemType? type) {
    _showDialogSetting.add(type);
  }
Future<void> getDocument() async {
    await Future.delayed(Duration(seconds: 10));
    _getDocumentVBDen.sink.add(FakeData.tinhHinhXuLyDocVBDen);
    _getDocumentVBDi.sink.add(FakeData.tinhHinhXuLyDocVBDi);
}
  void loadApi() {
    _getTinhHuongKhanCap();
  }

  void dispose() {
    _showDialogSetting.close();
    _tinhHuongKhanCap.close();
  }

  Stream<DocumentDashboardModel> get getDocumentVBDen =>
      _getDocumentVBDen.stream;

  Stream<DocumentDashboardModel> get getDocumentVBDi => _getDocumentVBDi.stream;
  Stream<UserInformationModel> get userInformation => _userInformation;
  Stream<List<TinhHuongKhanCapModel>> get tinhHuongKhanCap =>
      _tinhHuongKhanCap.stream;
  Stream<HomeItemType?> get showDialogSetting => _showDialogSetting.stream;
}
