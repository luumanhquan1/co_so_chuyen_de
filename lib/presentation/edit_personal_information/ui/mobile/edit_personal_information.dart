import 'package:ccvc_mobile/domain/model/edit_personal_information/edit_personal_information_model.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/bloc/edit_personal_information_cubit.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/ui/widgets/input_info.dart';
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
    // thuTuController.text =
    //     (widget.managerPersonalInformationModel.thuTu ?? 0) as String;
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('lucc'),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            InputInfo(
              managerPersonalInformationModel:
                  widget.managerPersonalInformationModel,
              formKey: formKey,
              cubit: cubit,
              nameController: nameController,
              emailController: emailController,
              sdtController: sdtController,
              cmndController: cmndController,
              diaChiLienHeController: diaChiLienHeController,
              maCanBoController: maCanBoController,
              sdtCoquanController: sdtCoquanController,
              thuTuController: thuTuController,
            ),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  print("đún");
                } else {
                  print("đún");
                }
              },
              child: Container(
                height: 50,
                child: Text("tap"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
