import 'package:ccvc_mobile/config/base/base_cubit.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/home/document_dashboard_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/quanlivanban/bloc/qlvb_state.dart';
import 'package:ccvc_mobile/widgets/chart/base_pie_chart.dart';
import 'package:rxdart/rxdart.dart';

class QLVBCCubit extends BaseCubit<QLVBState> {
  QLVBCCubit() : super(QLVbStateInitial());
  final BehaviorSubject<DocumentDashboardModel> _getVbDen =
      BehaviorSubject<DocumentDashboardModel>();

  final BehaviorSubject<DocumentDashboardModel> _getVbDi =
      BehaviorSubject<DocumentDashboardModel>();
  final BehaviorSubject<ChartData>_dataChartVBDen=BehaviorSubject<ChartData>();
  final BehaviorSubject<ChartData>_dataChartVBDi=BehaviorSubject<ChartData>();
  final List<ChartData> chartDataVbDen=[];
  final List<ChartData> chartDataVbDi=[];

  Stream<DocumentDashboardModel> get getVbDen => _getVbDen.stream;
  Stream<DocumentDashboardModel> get getVbDi => _getVbDi.stream;

  Stream<ChartData> get dataChatVbDen => _dataChartVBDen.stream;
  Stream<ChartData> get dataChatVbDi => _dataChartVBDi.stream;


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
    chartDataVbDen.add(ChartData( S.current.cho_xu_ly,
        dataVbDen.soLuongChoXuLy!.toDouble(),choXuLyColor,),);
    chartDataVbDen.add(ChartData( S.current.dang_xu_ly,
      dataVbDen.soLuongDangXuLy!.toDouble(),dangXyLyColor,),);
    chartDataVbDen.add(ChartData( S.current.da_xu_ly,
      dataVbDen.soLuongDaXuLy!.toDouble(),daXuLyColor,),);
    chartDataVbDen.add(ChartData( S.current.cho_vao_so,
      dataVbDen.soLuongChoVaoSo!.toDouble(),choVaoSoColor,),);

    _getVbDen.sink.add(dataVbDen);
  }
 void fakeDataVbDi(){
    final dataVbDi= DocumentDashboardModel(
      soLuongChoTrinhKy: 30,
      soLuongChoXuLy: 18,
      soLuongDaXuLy: 9,
      soLuongThuongKhan: 10,
    );
    chartDataVbDi.add(ChartData( S.current.cho_trinh_ky,
      dataVbDi.soLuongChoTrinhKy!.toDouble(),choTrinhKyColor,),);
    chartDataVbDi.add(ChartData( S.current.cho_xu_ly,
      dataVbDi.soLuongChoXuLy!.toDouble(),choXuLyColor,),);
    chartDataVbDi.add(ChartData( S.current.da_xu_ly,
      dataVbDi.soLuongDaXuLy!.toDouble(),daXuLyColor,),);
    _getVbDi.sink.add(dataVbDi);
 }

}



