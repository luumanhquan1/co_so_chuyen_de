import 'package:ccvc_mobile/domain/model/quan_ly_van_ban/van_ban_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/chi_tiet_van_ban/ui/phone/chi_tiet_van_ban_mobile.dart';
import 'package:ccvc_mobile/presentation/incoming_document/bloc/incoming_document_cubit.dart';
import 'package:ccvc_mobile/presentation/incoming_document/widget/incoming_document_cell.dart';
import 'package:ccvc_mobile/utils/constants/api_constants.dart';
import 'package:ccvc_mobile/utils/extensions/date_time_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/listview/listview_loadmore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IncomingDocumentScreen extends StatefulWidget {
  const IncomingDocumentScreen({Key? key}) : super(key: key);

  @override
  _IncomingDocumentScreenState createState() => _IncomingDocumentScreenState();
}

class _IncomingDocumentScreenState extends State<IncomingDocumentScreen> {
  late IncomingDocumentCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = IncomingDocumentCubit();
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarDefaultBack(
        S.current.danh_sach_van_ban_den,
      ),
      body: SafeArea(
        child: _content(),
      ),
    );
  }

  void callApi(int page, String startDate, String endDate) {
    cubit.listDataDanhSachVBDen(
      startDate: startDate,
      endDate: endDate,
      page: page,
      size: ApiConstants.DEFAULT_PAGE_SIZE,
    );
  }

  Widget _content() {
    return ListViewLoadMore(
      cubit: cubit,
      isListView: true,
      callApi: (page) => {
        callApi(page, '2022-02-01', '2022-02-28')
      },
      viewItem: (value) => itemVanBan(value as VanBanModel),
    );
  }

  Widget itemVanBan(VanBanModel data) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: IncomingDocumentCell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChiTietVanBanMobile(),
            ),
          );
        },
        title: data.loaiVanBan ?? '',
        dateTime: DateTime.parse(data.ngayDen ?? '').toStringWithListFormat,
        userName: data.nguoiSoanThao ?? '',
        status: data.doKhan ?? '',
        userImage:
            'https://th.bing.com/th/id/OIP.A44wmRFjAmCV90PN3wbZNgHaEK?pid=ImgDet&rs=1',
      ),
    );
  }
}
