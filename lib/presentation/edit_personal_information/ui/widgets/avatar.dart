// import 'dart:html';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ccvc_mobile/config/resources/strings.dart';
// import 'package:ccvc_mobile/presentation/edit_personal_information/bloc/edit_personal_information_cubit.dart';
// import 'package:ccvc_mobile/presentation/edit_personal_information/ui/widgets/dialog_utils.dart';
// import 'package:cool_alert/cool_alert.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class AvatarAndSignature extends StatelessWidget {
//   final EditPersonalInformationCubit editPersonalInformationCubit;
//
//   const AvatarAndSignature(
//       {Key? key, required this.editPersonalInformationCubit})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         treeWidget(context, 'doiAvatar', () async {
//           await upLoadImg(context, 1);
//         },
//             editPersonalInformationCubit
//                     .managerPersonalInformationModel.anhDaiDienFilePath ??
//                 '',
//             true),
//         treeWidget(context, 'doiChuKy', () async {
//           await upLoadImg(context, 2);
//         },
//             editPersonalInformationCubit
//                     .managerPersonalInformationModel.anhChuKyFilePath ??
//                 '',
//             false)
//       ],
//     );
//   }
//
//   Future<void> upLoadImg(BuildContext context, int loai) async {
//     if (await Permission.storage.isDenied) {
//       await DialogUtils.showDialogSetting(context);
//       return;
//     }
//     final FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//     );
//     print(result);
//     if (result != null) {
//       final File file = File(result.files.single.path ?? '');
//       viewModel
//           .uploadImage(
//               loai: loai,
//               xFile: file,
//               id: editPersonalInformationCubit
//                   .managerPersonalInformationModel.id!)
//           .then((value) {
//         if (value.hasError) {
//           CoolAlert.show(
//             context: context,
//             type: CoolAlertType.error,
//             text: value.error,
//           );
//         }
//       });
//     } else {
//       // User canceled the picker
//     }
//   }
//
//   Widget treeWidget(BuildContext context, String text, Function() onTap,
//       String url, bool isAvatarUser) {
//     return Column(
//       children: [
//         Container(
//             height: 100,
//             width: 100,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.transparent,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: const Offset(0, 1), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(50),
//               child: CachedNetworkImage(
//                 imageUrl: Strings.urlChuKyDefault,
//                 fit: BoxFit.fill,
//                 errorWidget: (context, url, error) {
//                   if (isAvatarUser) {
//                     return SvgPicture.asset('assets/images/user.svg');
//                   }
//                   // return Image.network(QLVBConstant.urlChuKyDefault);
//                   return CachedNetworkImage(
//                     imageUrl: Strings.urlChuKyDefault,
//                     errorWidget: (context, url, error) => const SizedBox(),
//                   );
//                 },
//               ),
//             )),
//         const SizedBox(
//           height: 16,
//         ),
//         InkWell(
//             onTap: onTap,
//             child: Ink(
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(4)),
//                     border: Border.all(color: const Color(0xffDBDFEF))),
//                 padding: const EdgeInsets.all(7),
//                 child: Text(
//                   text,
//                   style: Theme.of(context).textTheme.headline1,
//                 ),
//               ),
//             ))
//       ],
//     );
//   }
// }
