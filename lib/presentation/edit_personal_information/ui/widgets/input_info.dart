import 'package:ccvc_mobile/domain/model/edit_personal_information/edit_personal_information_model.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/bloc/edit_personal_information_cubit.dart';
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
  final EditPersonalInformationCubit cubit;

  const InputInfo({
    Key? key,
    required this.managerPersonalInformationModel,
    required this.formKey,
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
          Form(
              key: formKey,
              child: Column(
                children: [
                  InputInfoUserWidget(
                    isObligatory: true,
                    title: user.keys.elementAt(1),
                    child: TextFormFieldWidget(
                      controller: nameController,
                      isEnabled: true,
                      onChange: (value) {
                        formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
                    ),
                  ),
                  InputInfoUserWidget(
                    isObligatory: true,
                    title: user.keys.elementAt(2),
                    child: TextFormFieldWidget(
                      controller: maCanBoController,
                      isEnabled: true,
                      onChange: (value) {
                        formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
                    ),
                  ),
                  InputInfoUserWidget(
                    title: user.keys.elementAt(3),
                    child: TextFormFieldWidget(
                      controller: thuTuController,
                      isEnabled: true,
                      onChange: (value) {
                        formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
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
                  InputInfoUserWidget(
                    title: user.keys.elementAt(5),
                    child: TextFormFieldWidget(
                      controller: cmndController,
                      isEnabled: true,
                      onChange: (value) {
                        formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
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
                  InputInfoUserWidget(
                      isObligatory: true,
                      title: user.keys.elementAt(7),
                      child: TextFormFieldWidget(
                        controller: emailController,
                        initialValue: null,
                        isEnabled: true,
                        onChange: (value) {
                          formKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value!.checkEmail() == false) {
                            return 'emailEx';
                          }
                          return null;
                        },
                      )),
                  InputInfoUserWidget(
                      title: user.keys.elementAt(8),
                      child: TextFormFieldWidget(
                        controller: sdtCoquanController,
                        textInputType: TextInputType.number,
                        isEnabled: true,
                        onChange: (value) {
                          formKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value!.checkSdt() == false) {
                            return 'sdtEx';
                          }
                          return null;
                        },
                      )),
                  InputInfoUserWidget(
                    title: user.keys.elementAt(9),
                    child: TextFormFieldWidget(
                      controller: sdtController,
                      textInputType: TextInputType.number,
                      isEnabled: true,
                      onChange: (value) {
                        formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.checkSdt() == false) {
                          return 'sdtEx';
                        }
                        return null;
                      },
                    ),
                  ),
                  //xa, huyen
                  InputInfoUserWidget(
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
                  InputInfoUserWidget(
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
                  InputInfoUserWidget(
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
                  //
                  InputInfoUserWidget(
                    title: user.keys.elementAt(13),
                    child: TextFormFieldWidget(
                      controller: diaChiLienHeController,
                      isEnabled: true,
                    ),
                  )
                  //
                ],
              )),
        ]);
  }
}
