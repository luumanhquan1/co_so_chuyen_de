import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/hoi_dap/hoi_dap.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/edit_hdsd/ui/widget/block_textview.dart';
import 'package:ccvc_mobile/presentation/edit_hdsd/ui/widget/double_button_edit_hdsd.dart';
import 'package:ccvc_mobile/widgets/input_infor_user/input_info_user_widget.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class EditHDSDScreenTablet extends StatefulWidget {
  final HoiDap hoiDap;

  const EditHDSDScreenTablet({
    Key? key,
    required this.hoiDap,
  }) : super(key: key);

  @override
  _EditHDSDScreenTabletState createState() => _EditHDSDScreenTabletState();
}

class _EditHDSDScreenTabletState extends State<EditHDSDScreenTablet> {
  GlobalKey<FormState> formKeyChuDe = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLoaiHD = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyDanhSach = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyNoiDung = GlobalKey<FormState>();
  TextEditingController chuDeController = TextEditingController();
  TextEditingController loaiHDController = TextEditingController();
  TextEditingController danhSachController = TextEditingController();
  TextEditingController noiDungController = TextEditingController();

  @override
  void initState() {
    chuDeController.text = widget.hoiDap.chuDe ?? '';
    loaiHDController.text = widget.hoiDap.loaiHDSD ?? '';
    danhSachController.text = widget.hoiDap.danhSach ?? '';
    noiDungController.text = widget.hoiDap.noiDung ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> hoiDaps = widget.hoiDap.getInfoToMap();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            Column(
              children: [
                Form(
                  key: formKeyChuDe,
                  child: InputInfoUserWidget(
                    title: hoiDaps.keys.elementAt(1),
                    child: TextFormFieldWidget(
                      controller: chuDeController,
                      isEnabled: true,
                      onChange: (value) {
                        formKeyChuDe.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.current.khong_duoc_de_trong;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Form(
                  key: formKeyLoaiHD,
                  child: InputInfoUserWidget(
                    title: hoiDaps.keys.elementAt(2),
                    child: TextFormFieldWidget(
                      controller: loaiHDController,
                      isEnabled: true,
                      onChange: (value) {
                        formKeyLoaiHD.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.current.khong_duoc_de_trong;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Form(
                  key: formKeyDanhSach,
                  child: InputInfoUserWidget(
                    title: hoiDaps.keys.elementAt(3),
                    child: TextFormFieldWidget(
                      controller: danhSachController,
                      isEnabled: true,
                      onChange: (value) {
                        formKeyDanhSach.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.current.khong_duoc_de_trong;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                spaceH24,
                BlockTextView(
                  title: hoiDaps.keys.elementAt(4),
                  contentController: noiDungController,
                  formKey: formKeyNoiDung,
                ),
              ],
            ),
            spaceH36,
            DoubleButtonEditHDSDScreen(
              onPressed2: () {},
              title2: S.current.cap_nhat,
              onPressed1: () {},
              title1: S.current.xem_truoc,
            )
          ],
        ),
      ),
    );
  }
}
