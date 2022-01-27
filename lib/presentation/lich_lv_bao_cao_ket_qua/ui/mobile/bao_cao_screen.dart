import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/lich_lam_viec/bao_cao_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/lich_lv_bao_cao_ket_qua/bloc/bao_cao_cubit.dart';
import 'package:ccvc_mobile/presentation/lich_lv_bao_cao_ket_qua/ui/mobile/widgets/bao_cao_item.dart';
import 'package:flutter/material.dart';

class BaoCaoScreen extends StatefulWidget {
  const BaoCaoScreen({Key? key}) : super(key: key);

  @override
  _BaoCaoScreenState createState() => _BaoCaoScreenState();
}

class _BaoCaoScreenState extends State<BaoCaoScreen> {
  BaoCaoCubit cubit = BaoCaoCubit();

  @override
  void initState() {
    super.initState();
    cubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.bao_cao_ket_qua,
              style: textNormalCustom(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: titleColor,
              ),
            ),
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
                          return BaoCaoItem(
                            statusColor:listData[index].status.getText().color,
                            fileName: listData[index].fileName,
                            status: listData[index].status.getText().text,
                            content: listData[index].content,
                            funcEdit: () {  },
                            funcDelete: () {  },
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
