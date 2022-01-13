import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/config/resources/strings.dart';
import 'package:ccvc_mobile/domain/model/manager_personal_information/manager_personal_information_model.dart';
import 'package:ccvc_mobile/presentation/edit_personal_information/bloc/edit_personal_information_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarAndSignature extends StatelessWidget {
  final EditPersonalInformationCubit editPersonalInformationCubit;
  final ManagerPersonalInformationModel managerPersonalInformationModel;

  const AvatarAndSignature(
      {Key? key,
      required this.editPersonalInformationCubit,
      required this.managerPersonalInformationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: treeWidget(
            context,
            'doiAvatar',
            () async {
              await upLoadImg(context, 1);
            },
            editPersonalInformationCubit
                    .managerPersonalInformationModel.anhDaiDienFilePath ??
                '',
            true,
          ),
        ),
        Expanded(
          child: treeWidget(
            context,
            'doiChuKy',
            () async {
              await upLoadImg(context, 2);
            },
            editPersonalInformationCubit
                    .managerPersonalInformationModel.anhChuKyFilePath ??
                '',
            false,
          ),
        )
      ],
    );
  }

  Future<void> upLoadImg(BuildContext context, int loai) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      File file = File(result.files.single.path ?? '');
      await editPersonalInformationCubit.uploadImage(xFile: file);
    } else {}

    //print(result);
  }

  Widget treeWidget(BuildContext context, String text, Function() onTap,
      String url, bool isAvatarUser) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(1, 5), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: Strings.urlChuKyDefault,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) {
                  if (isAvatarUser) {
                    return SvgPicture.asset('assets/images/user.svg');
                  }
                  // return Image.network(QLVBConstant.urlChuKyDefault);
                  return CachedNetworkImage(
                    imageUrl: Strings.urlChuKyDefault,
                    errorWidget: (context, url, error) => const SizedBox(),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
