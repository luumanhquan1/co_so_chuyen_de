import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tin_tuc_thoi_su/tin_tuc_thoi_su_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/bloc/tin_tuc_thoi_su_bloc.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/ban_tin_btn_sheet.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/item_tin_radio.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/item_tin_trong_nuoc.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/drop_down_extension.dart';
import 'package:ccvc_mobile/widgets/views/state_stream_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum dropDown { tinRadio, tinTrongNuoc }

class TinTucThoiSuScreen extends StatefulWidget {
  final TinTucThoiSuBloc tinTucThoiSuBloc;
  final BuildContext pContext;

  const TinTucThoiSuScreen({
    Key? key,
    required this.tinTucThoiSuBloc,
    required this.pContext,
  }) : super(key: key);

  @override
  State<TinTucThoiSuScreen> createState() => _TinTucThoiSuScreenState();
}

class _TinTucThoiSuScreenState extends State<TinTucThoiSuScreen> {
  dropDown? valueChoose = dropDown.tinRadio;
  late List<TinTucRadioModel> listTinTuc;

  @override
  void initState() {
    super.initState();
    widget.tinTucThoiSuBloc.changeItem(dropDown.tinRadio);
    widget.tinTucThoiSuBloc
        .getListTinTucRadio('2022/02/12 00:00:00', '2022/03/14 23:59:59');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StateStreamLayout(
        textEmpty: S.current.khong_co_du_lieu,
        retry: () {},
        error: AppException('1', ''),
        stream: widget.tinTucThoiSuBloc.stateStream,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      clipBehavior: Clip.antiAlias,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: borderColor,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          elevation: 0,
                          value: valueChoose,
                          onChanged: (value) {
                            setState(() {
                              valueChoose = value as dropDown?;
                              widget.tinTucThoiSuBloc.changeItem(valueChoose);
                            });
                          },
                          items: <dropDown>[
                            dropDown.tinRadio,
                            dropDown.tinTrongNuoc
                          ]
                              .map<DropdownMenuItem<dropDown>>(
                                (value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value.getString(),
                                    style: textNormalCustom(
                                      color: titleColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showBottomSheet(
                          context: widget.pContext,
                          builder: (context) {
                            return BanTinBtnSheet(
                              listTinTuc: listTinTuc,
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 45,
                        decoration: BoxDecoration(
                          color: indicatorColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(ImageAssets.icPlay),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              S.current.nghe_doc_tin,
                              style: textNormalCustom(
                                color: indicatorColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: StreamBuilder(
                  stream: widget.tinTucThoiSuBloc.dropDownStream,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    switch (snapshot.data) {
                      case 1:
                      return StreamBuilder<TinTucRadioResponseModel>(
                        stream: widget.tinTucThoiSuBloc.listTinTucRadio,
                        builder: (context, snapshot) {
                          final listRadio =
                              snapshot.data?.listTinTucThoiSu ?? [];
                          listTinTuc = listRadio;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: listRadio.length,
                            itemBuilder: (context, index) {
                              return ItemTinRadio(
                                  'https://www.elleman.vn/wp-content/uploads/2019/05/20/4-buc-anh-dep-hinh-gau-truc.jpg',
                                  listRadio[index].title,
                                  listRadio[index].publishedTime,
                                  () {
                                    showBottomSheet(
                                      context: widget.pContext,
                                      builder: (context) {
                                        return BanTinBtnSheet(
                                          listTinTuc: listTinTuc,
                                          index: index,
                                        );
                                      },
                                    );
                                  },);
                            },
                          );
                        },
                      );

                      case 2:
                        return ItemTinTrongNuoc(
                          title: 'tienphong.vn ',
                          content:
                              'Bắc Ninh áp dụng đồng loạt các phương án ngăn ngừa biến chủng Omicron',
                          date: '5/11/2021 9:10:03 PM',
                          imgContent:
                              'https://baoquocte.vn/stores/news_dataimages/dieulinh/012020/29/15/nhung-buc-anh-dep-tuyet-voi-ve-tinh-ban.jpg',
                          imgTitle:
                              'https://www.elleman.vn/wp-content/uploads/2019/05/20/4-buc-anh-dep-hinh-gau-truc.jpg',
                        );

                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
