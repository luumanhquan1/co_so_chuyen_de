import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/theo_doi_bai_viet/theo_doi_bai_viet_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/thoi_doi_bai_viet/bloc/theo_doi_bai_viet_cubit.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/thoi_doi_bai_viet/ui/mobile/widgets/bai_viet_item.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/views/state_stream_layout.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:flutter/material.dart';

class TheoDoiBaiVietScreen extends StatefulWidget {
  final int topic;
  const TheoDoiBaiVietScreen({Key? key,required this.topic}) : super(key: key);

  @override
  _TheoDoiBaiVietScreenState createState() => _TheoDoiBaiVietScreenState();
}

class _TheoDoiBaiVietScreenState extends State<TheoDoiBaiVietScreen> {
  TextEditingController nhapLaiMatKhauController = TextEditingController();
  TheoDoiBaiVietCubit theoDoiBaiVietCubit = TheoDoiBaiVietCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theoDoiBaiVietCubit.getListBaiVietTheoDoi(
      theoDoiBaiVietCubit.endDate, theoDoiBaiVietCubit.startDate, widget.topic,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('1', ''),
        stream: theoDoiBaiVietCubit.stateStream,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.nhap_linK_bao_cao,
                style: textNormalCustom(
                  fontSize: 14,
                  color: dateColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BaseSearchBar(
                hintText: S.current.nhap_link,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                S.current.bai_theo_doi,
                style: textNormalCustom(
                  color: titleCalenderWork,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: StreamBuilder<TheoDoiBaiVietModel>(
                  stream: theoDoiBaiVietCubit.listBaiVietTheoDoi,
                  builder: (context, snapshot) {
                    final data = snapshot.data?.listBaiViet ?? [];
                    if(data.isNotEmpty){
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return BaiVietItem(
                            baiVietModel: data[index],
                          );
                        },
                      );
                    }
                    else{
                      return const
                      SizedBox();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
