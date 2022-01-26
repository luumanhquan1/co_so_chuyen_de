// import 'dart:html';
//
// import 'package:ccvc_mobile/config/resources/color.dart';
// import 'package:ccvc_mobile/config/resources/styles.dart';
// import 'package:ccvc_mobile/utils/constants/image_asset.dart';
// import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_svg/svg.dart';
//
// class ButtonSelectFile extends StatefulWidget {
//   final Color? background;
//   final String title;
//   final String? icon;
//
//   const ButtonSelectFile({
//     Key? key,
//     this.background,
//     required this.title,
//     this.icon,
//   }) : super(key: key);
//
//   @override
//   State<ButtonSelectFile> createState() => _ButtonSelectFileState();
// }
//
// class _ButtonSelectFileState extends State<ButtonSelectFile> {
//   File? file;
//
//   @override
//   Widget build(BuildContext context) {
//     final fileName = file != null ? file!.name : 'No File Selected';
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width * 0.5,
//           color: widget.background ?? labelColor.withOpacity(0.1),
//           padding: EdgeInsets.symmetric(
//             vertical: 8.0.textScale(),
//             horizontal: 16.0.textScale(),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(widget.icon ?? ImageAssets.icShareFile),
//               SizedBox(
//                 width: 11.25.textScale(),
//               ),
//               Text(
//                 widget.title,
//                 style: textNormalCustom(
//                   color: labelColor,
//                   fontSize: 14.0.textScale(),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 16.0.textScale(),
//         ),
//         ItemFile(nameFile: fileName, onPress: () {})
//       ],
//     );
//   }
//
//   Future selectFile() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: false);
//
//     if (result == null) return;
//     final path = result.files.single.path!;
//
//     setState(() => file = File([], path));
//   }
// }
//
// Widget ItemFile({
//   required String nameFile,
//   required Function onPress,
// }) {
//   return Container(
//     padding: EdgeInsets.all(16.0.textScale()),
//     decoration: BoxDecoration(
//       color: containerColorTab.withOpacity(0.1),
//       border: Border.all(
//         color: containerColorTab,
//       ),
//       borderRadius: BorderRadius.circular(6.0),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           nameFile,
//           style: textNormalCustom(
//             fontWeight: FontWeight.w400,
//             fontSize: 14.0.textScale(),
//             color: choXuLyColor,
//           ),
//         ),
//         GestureDetector(
//             onTap: () {
//               onPress();
//             },
//             child: SvgPicture.asset(ImageAssets.icDelete),)
//       ],
//     ),
//   );
// }
