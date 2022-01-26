
import 'package:ccvc_mobile/domain/model/lich_lam_viec/bao_cao_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/lich_lv_bao_cao_ket_qua/bloc/bao_cao_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_lv_bao_cao_ket_qua/ui/mobile/widgets/bao_cao_item.dart';
import 'package:ccvc_mobile/presentation/lich_lv_bao_cao_ket_qua/ui/tablet/widgets/bao_cao_item_tablet.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class BaoCaoTabletScreen extends StatefulWidget {
  const BaoCaoTabletScreen({Key? key}) : super(key: key);

  @override
  _BaoCaoTabletScreenState createState() => _BaoCaoTabletScreenState();
}

class _BaoCaoTabletScreenState extends State<BaoCaoTabletScreen> {
  BaoCaoCubit cubit = BaoCaoCubit();

  @override
  void initState() {
    super.initState();
    cubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
        S.current.bao_cao_ket_qua,
      ),
      body: Container(
        margin: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: StreamBuilder<List<BaoCaoModel>>(
                stream: cubit.listBaoCao,
                builder: (context, snapshot) {
                  final listData = snapshot.data ?? [];
                  if (listData.isNotEmpty) {
                    return MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listData.length,
                        itemBuilder: (context, index) {
                          return BaoCaoItemTablet(
                            statusColor: listData[index].status.getText().color,
                            fileName: listData[index].fileName,
                            status: listData[index].status.getText().text,
                            content: listData[index].content,
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(S.current.no_data),
                    );
                  }
                },
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
