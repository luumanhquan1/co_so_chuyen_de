

import 'dart:io';

import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/edit_personal_information/edit_personal_information_model.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/bloc/edit_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/ui/widgets/avatar.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/widget_don_vi_mobile.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/widget_ung_dung_mobile.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/dropdown/custom_drop_down.dart';
import 'package:ccvc_mobile/widgets/input_infor_user/input_info_user_widget.dart';
import 'package:ccvc_mobile/widgets/selectdate/custom_selectdate.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class InputInfo extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController maCanBoController;
  final TextEditingController thuTuController;
  final TextEditingController cmndController;
  final TextEditingController emailController;
  final TextEditingController sdtCoquanController;
  final TextEditingController sdtController;
  final TextEditingController diaChiLienHeController;

  //

  final ManagerPersonalInformationModel managerPersonalInformationModel;
  final GlobalKey<FormState> formKey;
  final GlobalKey<FormState> formKeyName;
  final GlobalKey<FormState> formKeyMa;
  final GlobalKey<FormState> formKeyThuTu;
  final GlobalKey<FormState> formKeyCmnd;
  final GlobalKey<FormState> formKeyEmail;
  final GlobalKey<FormState> formKeySdtCoQuan;
  final GlobalKey<FormState> formKeySDT;
  final EditPersonalInformationCubit cubit;

  const InputInfo({
    Key? key,
    required this.managerPersonalInformationModel,
    required this.formKey,
    required this.formKeyName,
    required this.formKeyMa,
    required this.formKeyThuTu,
    required this.formKeyCmnd,
    required this.formKeyEmail,
    required this.formKeySdtCoQuan,
    required this.formKeySDT,
    required this.cubit,
    required this.nameController,
    required this.maCanBoController,
    required this.thuTuController,
    required this.cmndController,
    required this.emailController,
    required this.sdtCoquanController,
    required this.sdtController,
    required this.diaChiLienHeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> user =
        managerPersonalInformationModel.getInfoToMap();
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Column(
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
                  onChange: (value) {
                    formKeyThuTu.currentState!.validate();
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
              title: user.keys.elementAt(4),
              child: CustomSelectDate(
                value: managerPersonalInformationModel.ngaySinh,
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
                  value: managerPersonalInformationModel.gioiTinh ?? false
                      ? 'Nam'
                      : 'Nu',
                  items: ['Nam', 'Nu'],
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
                  isObligatory: true,
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
                  isObligatory: true,
                  title: user.keys.elementAt(10),
                  child: CustomDropDown(
                    value: managerPersonalInformationModel.gioiTinh ?? false
                        ? 'Nam'
                        : 'Nu',
                    items: ['Nam', 'Nu'],
                    onSelectItem: (value) {
                      if (value == 0) {
                        cubit.selectGTEvent(true);
                      } else {
                        cubit.selectGTEvent(false);
                      }
                    },
                  )),
            ),
            Form(
              child: InputInfoUserWidget(
                  isObligatory: true,
                  title: user.keys.elementAt(11),
                  child: CustomDropDown(
                    value: managerPersonalInformationModel.gioiTinh ?? false
                        ? 'Nam'
                        : 'Nu',
                    items: ['Nam', 'Nu'],
                    onSelectItem: (value) {
                      if (value == 0) {
                        cubit.selectGTEvent(true);
                      } else {
                        cubit.selectGTEvent(false);
                      }
                    },
                  )),
            ),
            Form(
              child: InputInfoUserWidget(
                  isObligatory: true,
                  title: user.keys.elementAt(12),
                  child: CustomDropDown(
                    value: managerPersonalInformationModel.gioiTinh ?? false
                        ? 'Nam'
                        : 'Nu',
                    items: ['Nam', 'Nu'],
                    onSelectItem: (value) {
                      if (value == 0) {
                        cubit.selectGTEvent(true);
                      } else {
                        cubit.selectGTEvent(false);
                      }
                    },
                  )),
            ),
            Form(
                key: formKey,
                child: InputInfoUserWidget(
                  title: user.keys.elementAt(13),
                  child: TextFormFieldWidget(
                    controller: diaChiLienHeController,
                    isEnabled: true,
                    onChange: (value) {
                      formKey.currentState!.validate();
                    },
                    validator: (value) {
                      if (value!.checkSdt() == false) {
                        return 'Không được để trống';
                      }
                      return null;
                    },
                  ),
                )),

            //xa, huyen

            //

            //
          ],
        ),
        spaceH20,
        const WidgetDonVibMobile(),
        spaceH20,
        const WidgetUngDungMobile(),
        spaceH20,
        Expanded(
          child: StreamBuilder<File>(
              stream: cubit.saveFileStream,
              builder: (context, snapshot) {
                return AvatarAndSignature(
                  managerPersonalInformationModel: snapshot.data ,
                  editPersonalInformationCubit: EditPersonalInformationCubit(),
                );
              }),
        )
      ],
    );
  }
}
