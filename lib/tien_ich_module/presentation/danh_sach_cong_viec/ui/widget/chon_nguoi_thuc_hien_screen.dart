import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/home_module/widgets/text/text/no_data_widget.dart';
import 'package:ccvc_mobile/tien_ich_module/domain/model/nguoi_thuc_hien_model.dart';
import 'package:ccvc_mobile/tien_ich_module/presentation/danh_sach_cong_viec/bloc/danh_sach_cong_viec_tien_ich_cubit.dart';
import 'package:ccvc_mobile/tien_ich_module/widget/search/base_search_bar.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:flutter/material.dart';

class ChonNguoiThucHienScreen extends StatefulWidget {
  final DanhSachCongViecTienIchCubit cubit;

  const ChonNguoiThucHienScreen({Key? key, required this.cubit})
      : super(key: key);

  @override
  _DanhSachCongViecTienIchMobileState createState() =>
      _DanhSachCongViecTienIchMobileState();
}

class _DanhSachCongViecTienIchMobileState
    extends State<ChonNguoiThucHienScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.cubit.listNguoiThucHien();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultBack(S.current.chon_nguoi_thuc_hien),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseSearchBar(
                hintText: S.current.tim_kiem_nhanh,
                onChange: (value) {},
              ),
              StreamBuilder<List<NguoiThucHienModel>>(
                stream: widget.cubit.nguoiThucHien.stream,
                builder: (context, snapshot) {
                  final data = snapshot.data ?? [];
                  if (data.isNotEmpty) {
                    return ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final todo = data[index];
                        return GestureDetector(
                          onTap: () {
                            widget.cubit.getPersontodo(
                              person:
                                  '${todo.hoten.isNotEmpty ? todo.hoten : ''}${todo.donVi.isNotEmpty ? ' - ${todo.donVi.join(', ')}' : ''}${todo.chucVu.isNotEmpty ? ' - ${todo.chucVu.join(', ')}' : ''}',
                              idPerson: todo.id,
                            );
                            widget.cubit.enabled.sink.add(true);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: Wrap(
                              children: [
                                Text(
                                  todo.hoten.isNotEmpty ? todo.hoten : '',
                                  style: textNormalCustom(
                                    color: titleItemEdit,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0.textScale(),
                                  ),
                                ),
                                Text(
                                  todo.donVi.isNotEmpty
                                      ? ' - ${todo.donVi.join(', ')}'
                                      : '',
                                  style: textNormalCustom(
                                    color: titleItemEdit,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0.textScale(),
                                  ),
                                ),
                                Text(
                                  todo.chucVu.isNotEmpty
                                      ? ' - ${todo.chucVu.join(', ')}'
                                      : '',
                                  style: textNormalCustom(
                                    color: titleItemEdit,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0.textScale(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: NodataWidget(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
