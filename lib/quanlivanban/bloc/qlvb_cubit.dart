import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/quanlivanban/bloc/qlvb_state.dart';
import 'package:rxdart/rxdart.dart';

class QLVBCCubit extends BaseCubit<QLVBState> {
  QLVBCCubit() : super(QLVbStateInitial());
  final BehaviorSubject<DocumentDashboardModel> _getVbDen =
      BehaviorSubject<DocumentDashboardModel>();

  final BehaviorSubject<DocumentDashboardModel> _getVbDi =
      BehaviorSubject<DocumentDashboardModel>();

  Stream<DocumentDashboardModel> get getVbDen => _getVbDen.stream;

  Stream<DocumentDashboardModel> get getVbDi => _getVbDi.stream;


 void  callAPi(){
   fakeDataVbDen();
   fakeDataVbDi();
 }

  void fakeDataVbDen() {
    final dataVbDen= DocumentDashboardModel(
      soLuongChoXuLy: 30,
      soLuongDangXuLy: 10,
      soLuongDaXuLy: 14,
      soLuongChoVaoSo: 7,
      soLuongTrongHan: 6,
      soLuongQuaHan: 20,
      soLuongThuongKhan: 12,

    );
    _getVbDen.sink.add(dataVbDen);
  }
 void fakeDataVbDi(){
    final dataVbDi= DocumentDashboardModel(
      soLuongChoTrinhKy: 30,
      soLuongChoXuLy: 18,
      soLuongDaXuLy: 9,
      soLuongChoCapSo: 14,
      soLuongChoBanHanh: 13,
    );
    _getVbDi.sink.add(dataVbDi);
 }
}



