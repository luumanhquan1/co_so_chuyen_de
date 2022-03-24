import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/theo_doi_bai_viet/theo_doi_bai_viet_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/thoi_doi_bai_viet/bloc/theo_doi_bai_viet_cubit.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/thoi_doi_bai_viet/ui/tablet/widgets/bai_viet_item_tablet.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/views/state_stream_layout.dart';
import 'package:ccvc_mobile/widgets/search/base_search_bar.dart';
import 'package:flutter/material.dart';

class TheoDoiBaiVietTablet extends StatefulWidget {
  final int topic;

  const TheoDoiBaiVietTablet({Key? key, required this.topic}) : super(key: key);

  @override
  _TheoDoiBaiVietTabletState createState() => _TheoDoiBaiVietTabletState();
}

class _TheoDoiBaiVietTabletState extends State<TheoDoiBaiVietTablet> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController nhapLaiMatKhauController = TextEditingController();
  TheoDoiBaiVietCubit theoDoiBaiVietCubit = TheoDoiBaiVietCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (theoDoiBaiVietCubit.pageIndex <= theoDoiBaiVietCubit.totalPage) {
          theoDoiBaiVietCubit.pageIndex += 1;
          theoDoiBaiVietCubit.getListBaiVietTheoDoi(
            theoDoiBaiVietCubit.endDate,
            theoDoiBaiVietCubit.startDate,
            widget.topic,
          );
        }
      }
    });
    theoDoiBaiVietCubit.getListBaiVietTheoDoi(
      theoDoiBaiVietCubit.endDate,
      theoDoiBaiVietCubit.startDate,
      widget.topic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('', S.current.something_went_wrong),
        stream: theoDoiBaiVietCubit.stateStream,
        child: Container(
          color:bgManagerColor,
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
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: shadowContainerColor.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: BaseSearchBar(
                  hintText: S.current.nhap_link,
                ),
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
                    if (data.isNotEmpty) {
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 28,
                          crossAxisSpacing: 28,
                          childAspectRatio: 1.5,
                          mainAxisExtent: 420,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return BaiVietItemTablet(
                            baiVietModel: data[index],
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
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
