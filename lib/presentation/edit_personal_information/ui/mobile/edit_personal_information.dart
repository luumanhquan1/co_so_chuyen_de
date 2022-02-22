import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/data/request/edit_person_information/edit_person_information_request.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/domain/model/tinh_huyen_xa/tinh_huyen_xa_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/ui/mobile/widget/custom_select_tinh.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/ui/mobile/widget/selectdate.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/ui/widgets/avatar.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/bloc/manager_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/manager_provider.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/widget_don_vi_mobile.dart';
import 'package:ccvc_mobile/presentation/manager_personal_information/ui/mobile/widget/widget_ung_dung_mobile.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/extensions/string_extension.dart';
import 'package:ccvc_mobile/widgets/appbar/base_app_bar.dart';
import 'package:ccvc_mobile/widgets/button/double_button_bottom.dart';
import 'package:ccvc_mobile/widgets/dropdown/custom_drop_down.dart';
import 'package:ccvc_mobile/widgets/input_infor_user/input_info_user_widget.dart';
import 'package:ccvc_mobile/widgets/textformfield/form_group.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_field_validator.dart';
import 'package:ccvc_mobile/widgets/textformfield/text_form_field_widget.dart';
import 'package:ccvc_mobile/widgets/views/state_stream_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditPersonInformationScreen extends StatefulWidget {
  final String id;
  final ManagerPersonalInformationCubit cubit;
  const EditPersonInformationScreen({
    Key? key,
    required this.id,
    required this.cubit
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditPersonalInformationScreen();
}

class _EditPersonalInformationScreen
    extends State<EditPersonInformationScreen> {
  // ManagerPersonalInformationCubit cubit = ManagerPersonalInformationCubit();
  TextEditingController nameController = TextEditingController();
  TextEditingController maCanBoController = TextEditingController();
  TextEditingController thuTuController = TextEditingController();
  TextEditingController cmndController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sdtCoquanController = TextEditingController();
  TextEditingController sdtController = TextEditingController();
  TextEditingController diaChiLienHeController = TextEditingController();
  final keyGroup = GlobalKey<FormGroupState>();
  List<String> listData = [];
  String tinh = '';
  String huyen = '';
  String xa = '';
  String dateTimes = '';
  bool gioiTinh = true;

  @override
  void initState() {
    widget.cubit.loadApi(id: widget.id);
    super.initState();
    widget.cubit.managerStream.listen((event) {
      widget.cubit.getCurrentUnit(event);
      nameController.text = event.hoTen ?? 'Họ tên';
      maCanBoController.text = event.maCanBo ?? 'Mã cán bộ';
      thuTuController.text = event.thuTu.toString();
      cmndController.text = event.cmtnd ?? 'Số CMND';
      emailController.text = event.email ?? 'Email';
      sdtCoquanController.text = event.phoneCoQuan ?? 'Số điện thoại cơ quan';
      sdtController.text = event.phoneDiDong ?? 'Số điện thoại';
      diaChiLienHeController.text = event.diaChi ?? 'Địa chỉ';
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> user =
    widget.cubit.managerPersonalInformationModel.getInfoToMap();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: BaseAppBar(
        title: S.current.chinh_sua_thong_tin,
        leadingIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: SvgPicture.asset(ImageAssets.icBack),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {
                widget.cubit.getInfo(id: widget.id);
                if (keyGroup.currentState!.validator()) {
                } else {}
              },
              child: Text(
                S.current.reset,
                style: textNormalCustom(fontSize: 14, color: labelColor),
              ),
            ),
          )
        ],
      ),
      body: ManagerProvider(
        managerCubit: widget.cubit,
        child: StateStreamLayout(
          textEmpty: S.current.khong_co_du_lieu,
          retry: () {},
          error: AppException('1', ''),
          stream: widget.cubit.stateStream,
          child: RefreshIndicator(
            onRefresh: () async {
              await widget.cubit.getInfo(id: widget.id);
              if (keyGroup.currentState!.validator()) {
              } else {}
            },
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FormGroup(
                key: keyGroup,
                child: StreamBuilder<ManagerPersonalInformationModel>(
                  stream: widget.cubit.managerStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox();
                    }
                    return Column(
                      children: [
                        InputInfoUserWidget(
                          isObligatory: true,
                          title: user.keys.elementAt(1),
                          child: TextFieldValidator(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return S.current.khong_duoc_de_trong;
                              }
                              return null;
                            },
                          ),
                        ),
                        InputInfoUserWidget(
                          isObligatory: true,
                          title: user.keys.elementAt(2),
                          child: TextFieldValidator(
                            controller: maCanBoController,
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return S.current.khong_duoc_de_trong;
                              }
                              return null;
                            },
                          ),
                        ),
                        InputInfoUserWidget(
                          title: user.keys.elementAt(3),
                          child: TextFieldValidator(
                            controller: thuTuController,
                          ),
                        ),
                        InputInfoUserWidget(
                          isObligatory: true,
                          title: user.keys.elementAt(4),
                          child: SelectDate(
                            key: UniqueKey(),
                            paddings: 10,
                            leadingIcon:
                                SvgPicture.asset(ImageAssets.icEditInfor),
                            value:
                            widget.cubit.managerPersonalInformationModel.ngaySinh,
                            onSelectDate: (dateTime) {
                              widget.cubit.selectBirthdayEvent(dateTime);
                              //   dateTimes = dateTime;
                            },
                          ),
                        ),
                        InputInfoUserWidget(
                          title: user.keys.elementAt(5),
                          child: TextFieldValidator(
                            controller: cmndController,
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return S.current.khong_duoc_de_trong;
                              }
                              return null;
                            },
                          ),
                        ),
                        InputInfoUserWidget(
                          isObligatory: true,
                          title: user.keys.elementAt(6),
                          child: CustomDropDown(
                            value: widget.cubit.managerPersonalInformationModel
                                        .gioiTinh ??
                                    false
                                ? S.current.Nam
                                : S.current.Nu,
                            items: widget.cubit.fakeDataGioiTinh,
                            onSelectItem: (value) {
                              if (value == 0) {
                                widget.cubit.selectGTEvent(true);
                                gioiTinh = true;
                              } else {
                                widget.cubit.selectGTEvent(false);
                                gioiTinh = false;
                              }
                            },
                          ),
                        ),
                        InputInfoUserWidget(
                          title: user.keys.elementAt(7),
                          child: TextFieldValidator(
                            controller: emailController,
                            validator: (value) {
                              return (value ?? '').checkEmail();
                            },
                          ),
                        ),
                        InputInfoUserWidget(
                          title: user.keys.elementAt(8),
                          child: TextFieldValidator(
                            controller: sdtCoquanController,
                            textInputType: TextInputType.number,
                            validator: (value) {
                              return (value ?? '').checkSdt();
                            },
                          ),
                        ),
                        //
                        InputInfoUserWidget(
                          title: user.keys.elementAt(9),
                          child: TextFieldValidator(
                            controller: sdtController,
                            textInputType: TextInputType.number,
                            validator: (value) {
                              return (value ?? '').checkSdt();
                            },
                          ),
                        ),
                        StreamBuilder<List<TinhHuyenXaModel>>(
                          stream: widget.cubit.tinhStream,
                          builder: (context, snapshot) {
                            final data = snapshot.data ?? [];
                            return InputInfoUserWidget(
                              title: user.keys.elementAt(10),
                              child: CustomSelectTinh(
                                initialValue:
                                widget.cubit.managerPersonalInformationModel.tinh,
                                key: UniqueKey(),
                                title: S.current.tinh_thanh,
                                items: data,
                                onChange: (indexes, id) {
                                  widget.cubit.huyenSubject.sink.add([]);
                                  widget.cubit.xaSubject.sink.add([]);
                                  widget.cubit.getDataHuyenXa(
                                    isXa: false,
                                    parentId: widget.cubit.tinhModel[indexes].id ?? '',
                                  );
                                  if (indexes >= 0) {
                                    widget.cubit.isCheckTinhSubject.sink.add(false);
                                  }
                                  tinh = data[indexes].name ?? '';
                                },
                                onRemove: () {
                                  widget.cubit.huyenSubject.sink.add([]);
                                  widget.cubit.isCheckTinhSubject.sink.add(true);
                                  widget.cubit.isCheckHuyenSubject.sink.add(true);
                                },
                                cubit: widget.cubit,
                                isEnable: widget.cubit.huyenSubject.value.isEmpty,
                              ),
                            );
                          },
                        ),
                        StreamBuilder<List<TinhHuyenXaModel>>(
                          stream: widget.cubit.huyenStream,
                          builder: (context, snapshot) {
                            final data = snapshot.data ?? [];
                            if (data.isEmpty) {
                              widget.cubit.xaSubject.sink.add([]);
                            }
                            return InputInfoUserWidget(
                              title: user.keys.elementAt(11),
                              child: CustomSelectTinh(
                                initialValue:
                                widget.cubit.managerPersonalInformationModel.huyen,
                                key: UniqueKey(),
                                title: S.current.quan_huyen,
                                items: data,
                                onChange: (indexes, id) {
                                  widget.cubit.xaSubject.sink.add([]);
                                  widget.cubit.getDataHuyenXa(
                                    isXa: true,
                                    parentId:
                                    widget.cubit.huyenModel[indexes].id ?? '',
                                  );
                                  if (indexes >= 0) {
                                    widget.cubit.isCheckTinhSubject.sink.add(false);
                                  }
                                  huyen = data[indexes].name ?? '';
                                },
                                onRemove: () {
                                  widget.cubit.xaSubject.sink.add([]);
                                  widget.cubit.isCheckTinhSubject.sink.add(true);
                                  widget.cubit.isCheckHuyenSubject.sink.add(true);
                                },
                                cubit: widget.cubit,
                                isEnable: widget.cubit.huyenSubject.value.isEmpty,
                              ),
                            );
                          },
                        ),
                        StreamBuilder<List<TinhHuyenXaModel>>(
                          stream: widget.cubit.xaStream,
                          builder: (context, snapshot) {
                            final data = snapshot.data ?? [];
                            return InputInfoUserWidget(
                              title: user.keys.elementAt(12),
                              child: CustomSelectTinh(
                                initialValue:
                                widget.cubit.managerPersonalInformationModel.xa,
                                key: UniqueKey(),
                                title: S.current.phuong_xa,
                                items: data,
                                onChange: (indexes, id) {
                                  if (indexes >= 0) {
                                    widget.cubit.isCheckTinhSubject.sink.add(false);
                                  }
                                  xa = data[indexes].name ?? '';
                                },
                                onRemove: () {
                                  widget.cubit.isCheckTinhSubject.sink.add(true);
                                  widget.cubit.isCheckHuyenSubject.sink.add(true);
                                },
                                cubit: widget.cubit,
                                isEnable: widget.cubit.xaSubject.value.isEmpty,
                              ),
                            );
                          },
                        ),

                        InputInfoUserWidget(
                          title: user.keys.elementAt(13),
                          child: TextFormFieldWidget(
                            controller: diaChiLienHeController,
                            isEnabled: true,
                          ),
                        ),
                        spaceH20,
                        WidgetDonVibMobile(
                          cubit: widget.cubit,
                        ),
                        spaceH20,
                        WidgetUngDungMobile(
                          cubit: widget.cubit,
                        ),
                        spaceH20,
                        AvatarAndSignature(
                          cubit: widget.cubit,
                        ),
                        spaceH20,
                        DoubleButtonBottom(
                          onPressed1: () {
                            Navigator.pop(context);
                          },
                          onPressed2: () {
                            if (keyGroup.currentState!.validator()) {
                              EditPersonInformationRequest editPerson =
                                  EditPersonInformationRequest(
                                id: widget.id,
                                maCanBo: maCanBoController.value.text,
                                hoTen: nameController.value.text,
                                phoneDiDong: '',
                                phoneCoQuan: sdtCoquanController.value.text,
                                phoneNhaRieng: sdtController.value.text,
                                email: emailController.value.text,
                                gioiTinh: gioiTinh,
                                ngaySinh: dateTimes,
                                userName: '',
                                userId: '',
                                iDDonViHoatDong: '',
                                cmtnd: cmndController.value.text,
                                anhDaiDienFilePath: '',
                                anhChuKyFilePath: '',
                                anhChuKyNhayFilePath: '',
                                bitChuyenCongTac: true,
                                thoiGianCapNhat: '',
                                bitNhanTinBuonEmail: true,
                                bitNhanTinBuonSMS: true,
                                bitDanhBa: true,
                                chucVu: '',
                                donVi: '',
                                bitThuTruongDonVi: true,
                                bitDauMoiPAKN: true,
                                diaChi: diaChiLienHeController.value.text,
                                donViDetail: widget.cubit
                                    .editPersonInformationRequest.donViDetail,
                                chucVuDetail: '',
                                nhomChucVuDetail: '',
                                thuTu: 7,
                                iThuTu: 0,
                                tinh: tinh,
                                huyen: huyen,
                                xa: xa,
                                tinhId: '',
                                huyenId: '',
                                xaId: '',
                                departments: widget.cubit
                                    .editPersonInformationRequest.departments,
                                userAccounts: [],
                                lsCanBoKiemNhiemResponse: [],
                              );

                              widget.cubit.getEditPerson(editPerson);
                              print('aaaa');
                            } else {
                              print('llll');
                            }
                          },
                          title1: S.current.dong,
                          title2: S.current.luu_lai,
                        ),
                        spaceH32,
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
