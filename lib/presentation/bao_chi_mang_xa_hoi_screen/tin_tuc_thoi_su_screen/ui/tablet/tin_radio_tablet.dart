import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/bao_chi_mang_xa_hoi/tin_tuc_thoi_su/tin_tuc_thoi_su_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/bloc/tin_tuc_thoi_su_bloc.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/tablet/widgets/item_tin_radio_tablet.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/dropdown/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:readmore/readmore.dart';

enum dropDown { tinRadio, tinTrongNuoc }

class TinRadioScreen extends StatefulWidget {
  final TinTucThoiSuBloc tinTucThoiSuBloc;
  final String title;

  const TinRadioScreen(
      {Key? key, required this.title, required this.tinTucThoiSuBloc})
      : super(key: key);

  @override
  _TinRadioScreenState createState() => _TinRadioScreenState();
}

class _TinRadioScreenState extends State<TinRadioScreen> {
  late List<TinTucRadioModel> listTinTuc;
  dropDown? valueChoose = dropDown.tinRadio;

  @override
  void initState() {
    super.initState();
    // widget.tinTucThoiSuBloc.changeItem(dropDown.tinRadio);
    widget.tinTucThoiSuBloc
        .getListTinTucRadio('2022/02/12 00:00:00', '2022/03/14 23:59:59');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(
        widget.title,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(28, 20, 28, 0),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    ImageAssets.ic_bg_radio,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 124,
                        width: 124,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              ImageAssets.icDongNai,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.current.ubnd_dongnai,
                            style: textNormalCustom(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0.textScale(space: 20),
                              color: backgroundColorApp,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            S.current.tin_radio,
                            style: textNormalCustom(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0.textScale(space: 8),
                              color: backgroundColorApp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      Text(
                        S.current.sap_xep_theo,
                        style: textNormalCustom(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0.textScale(),
                          color: infoColor,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                        height: 50,
                        width: 160,
                        child: CustomDropDown(
                          items: ['A', 'B', "c"],
                          onSelectItem: (value) {},
                          hint: const Text('Moi Nhat'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 48,
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    S.current.thong_tin_gioi_thieu,
                    style: textNormalCustom(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0.textScale(space: 4),
                      color: titleCalenderWork,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          height: 1,
                          color: lineColor,
                        ),
                        Expanded(
                          child: StreamBuilder<TinTucRadioResponseModel>(
                            stream: widget.tinTucThoiSuBloc.listTinTucRadio,
                            builder: (context, snapshot) {
                              final listRadio =
                                  snapshot.data?.listTinTucThoiSu ?? [];
                              listTinTuc = listRadio;
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: listRadio.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: ItemTinRadioTablet(
                                      'https://www.elleman.vn/wp-content/uploads/2019/05/20/4-buc-anh-dep-hinh-gau-truc.jpg',
                                      listRadio[index].title,
                                      listRadio[index].publishedTime,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ReadMoreText(
                              'Kênh radio chính thức của UBND tỉnh Đồng Nai. '
                              'Kênh radio chính thức của UBND tỉnh Đồng Nai '
                              'Kênh radio chính thức của UBND tỉnh Đồng Nai '
                              'Kênh radio chính thức của UBND tỉnh Đồng Nai '
                              'Kênh radio chính thức của UBND tỉnh Đồng Nai '
                              'Kênh radio chính thức của UBND tỉnh Đồng NaiKênh '
                              'Kênh radio chính thức của UBND tỉnh Đồng NaiKênh '
                              'Kênh radio chính thức của UBND tỉnh Đồng NaiKênh '
                              'radio chính thức của UBND tỉnh Đồng NaiKênh radio chính'
                              ' thức của UBND tỉnh Đồng Nai',
                              trimLines: 6,
                              colorClickableText: labelColor,
                              trimMode: TrimMode.Line,
                              style: textNormalCustom(
                                color: infoColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              trimCollapsedText: 'Xem them',
                              trimExpandedText: 'thu gon',
                              moreStyle: textNormalCustom(
                                color: labelColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
