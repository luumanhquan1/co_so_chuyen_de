import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/bloc/edit_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/ui/widgets/avatar.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/ui/widgets/custom_select_multi_items.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/widget_don_vi_mobile.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/widget_ung_dung_mobile.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/app_bar_default_back.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:ccvc_mobile/widgets/dropdown/custom_drop_down.dart';
import 'package:ccvc_mobile/widgets/input_infor_user/input_info_user_widget.dart';
import 'package:ccvc_mobile/widgets/selectdate/custom_selectdate.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class EditPersonInformationScreen extends StatefulWidget {
  final ManagerPersonalInformationModel managerPersonalInformationModel;

  const EditPersonInformationScreen(
      {Key? key, required this.managerPersonalInformationModel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditPersonalInformationScreen();
}

class _EditPersonalInformationScreen
    extends State<EditPersonInformationScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyName = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyMa = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyThuTu = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyCmnd = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySdtCoQuan = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySDT = GlobalKey<FormState>();
  EditPersonalInformationCubit cubit = EditPersonalInformationCubit();
  TextEditingController nameController = TextEditingController();
  TextEditingController maCanBoController = TextEditingController();
  TextEditingController thuTuController = TextEditingController();
  TextEditingController cmndController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sdtCoquanController = TextEditingController();
  TextEditingController sdtController = TextEditingController();
  TextEditingController diaChiLienHeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    cubit.getCurrentUnit(widget.managerPersonalInformationModel);
    nameController.text = widget.managerPersonalInformationModel.hoTen ?? '';
    maCanBoController.text =
        widget.managerPersonalInformationModel.maCanBo ?? '';
    thuTuController.text =
        widget.managerPersonalInformationModel.thuTu.toString();
    cmndController.text = widget.managerPersonalInformationModel.cmtnd ?? '';
    emailController.text = widget.managerPersonalInformationModel.email ?? '';
    sdtCoquanController.text =
        widget.managerPersonalInformationModel.phoneCoQuan ?? '';
    sdtController.text =
        widget.managerPersonalInformationModel.phoneDiDong ?? '';
    diaChiLienHeController.text =
        widget.managerPersonalInformationModel.diaChi ?? '';
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> user =
        cubit.managerPersonalInformationModel.getInfoToMap();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarDefaultBack(S.current.chinh_sua_thong_tin),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Form(
              key: formKeyName,
              child: InputInfoUserWidget(
                isObligatory: true,
                title: user.keys.elementAt(1),
                child: TextFormFieldWidget(
                  controller: nameController,
                  isEnabled: true,
                  onChange: (value) {
                    formKeyName.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Không được để trống';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Form(
              key: formKeyMa,
              child: InputInfoUserWidget(
                isObligatory: true,
                title: user.keys.elementAt(2),
                child: TextFormFieldWidget(
                  controller: maCanBoController,
                  isEnabled: true,
                  onChange: (value) {
                    formKeyMa.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Không được để trống';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Form(
              key: formKeyThuTu,
              child: InputInfoUserWidget(
                title: user.keys.elementAt(3),
                child: TextFormFieldWidget(
                  controller: thuTuController,
                  isEnabled: true,
                ),
              ),
            ),
            InputInfoUserWidget(
              isObligatory: true,
              title: user.keys.elementAt(4),
              child: CustomSelectDate(
                value: cubit.managerPersonalInformationModel.ngaySinh,
                onSelectDate: (dateTime) {
                  cubit.selectBirthdayEvent(dateTime.toString());
                },
              ),
            ),
            Form(
              key: formKeyCmnd,
              child: InputInfoUserWidget(
                title: user.keys.elementAt(5),
                child: TextFormFieldWidget(
                  controller: cmndController,
                  isEnabled: true,
                  onChange: (value) {
                    formKeyCmnd.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Không được để trống';
                    }
                    return null;
                  },
                ),
              ),
            ),
            InputInfoUserWidget(
                isObligatory: true,
                title: user.keys.elementAt(6),
                child: CustomDropDown(
                  value: cubit.managerPersonalInformationModel.gioiTinh ?? false
                      ? 'Nam'
                      : 'Nữ',
                  items: cubit.fakeDataGioiTinh,
                  onSelectItem: (value) {
                    if (value == 0) {
                      cubit.selectGTEvent(true);
                    } else {
                      cubit.selectGTEvent(false);
                    }
                  },
                )),
            Form(
              key: formKeyEmail,
              child: InputInfoUserWidget(
                  title: user.keys.elementAt(7),
                  child: TextFormFieldWidget(
                    controller: emailController,
                    initialValue: null,
                    isEnabled: true,
                    onChange: (value) {
                      formKeyEmail.currentState!.validate();
                    },
                    validator: (value) {
                      if (value!.checkEmail() == false) {
                        return 'emailEx';
                      }
                      return null;
                    },
                  )),
            ),
            Form(
              key: formKeySdtCoQuan,
              child: InputInfoUserWidget(
                  title: user.keys.elementAt(8),
                  child: TextFormFieldWidget(
                    controller: sdtCoquanController,
                    textInputType: TextInputType.number,
                    isEnabled: true,
                    onChange: (value) {
                      formKeySdtCoQuan.currentState!.validate();
                    },
                    validator: (value) {
                      if (value!.checkSdt() == false) {
                        return 'sdtEx';
                      }
                      return null;
                    },
                  )),
            ),
            //
            Form(
              key: formKeySDT,
              child: InputInfoUserWidget(
                title: user.keys.elementAt(9),
                child: TextFormFieldWidget(
                  controller: sdtController,
                  textInputType: TextInputType.number,
                  isEnabled: true,
                  onChange: (value) {
                    formKeySDT.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.checkSdt() == false) {
                      return 'sdtEx';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Form(
              child: InputInfoUserWidget(
                title: user.keys.elementAt(10),
                child: CustomSelectItems(
                  title: 'Tỉnh/Thành phố',
                  context: context,
                  items: cubit.fakeDataTinh,
                  onChange: (indexes) {
                    //  widget._viewModel.selectGroup(indexes);
                  },
                  onRemoveItem: (index) {},
                  isCheckEnable: true,
                ),
              ),
            ),
            Form(
              child: InputInfoUserWidget(
                title: user.keys.elementAt(11),
                child: CustomSelectItems(
                  title: 'Quận/Huyện',
                  context: context,
                  items: cubit.fakeDataTinh,
                  onChange: (indexes) {
                    //  widget._viewModel.selectGroup(indexes);
                  },
                  onRemoveItem: (index) {},
                  isCheckEnable: false,
                ),
              ),
            ),
            Form(
              child: InputInfoUserWidget(
                title: user.keys.elementAt(12),
                child: CustomSelectItems(
                  title: 'Phường/Xã',
                  context: context,
                  items: cubit.fakeDataTinh,
                  onChange: (indexes) {
                    //  widget._viewModel.selectGroup(indexes);
                  },
                  onRemoveItem: (index) {},
                  isCheckEnable: true,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: InputInfoUserWidget(
                title: user.keys.elementAt(13),
                child: TextFormFieldWidget(
                  controller: diaChiLienHeController,
                  isEnabled: true,
                ),
              ),
            ),
            spaceH20,
            const WidgetDonVibMobile(),
            spaceH20,
            const WidgetUngDungMobile(),
            spaceH20,
            AvatarAndSignature(
              editPersonalInformationCubit: EditPersonalInformationCubit(),
            ),
            spaceH20,
            ButtonCustomBottom(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  print("dung");
                } else {
                  print("sai");
                }
              },
              title: S.current.thay_doi,
              isColorBlue: true,
            ),
            spaceH32,
          ],
        ),
      ),
    );
  }
}
