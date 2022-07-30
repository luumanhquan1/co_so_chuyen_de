import 'dart:typed_data';

import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatefulWidget {
  final Function(Uint8List? image) onChangeImage;

  const PickImageWidget({Key? key, required this.onChangeImage})
      : super(key: key);

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  Uint8List? _image;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _image = await image.readAsBytes();
      widget.onChangeImage(_image);
    }

    setState(() {});
  }

  void removeImg() {
    _image = null;
    widget.onChangeImage(_image);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _image == null ? emptyImage() : imageWidget();
  }

  Widget imageWidget() {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorDBDFEF.withOpacity(0.5)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: MemoryImage(_image ?? Uint8List(0)),
            ),
            boxShadow: [
              BoxShadow(
                color: color6566E9.withOpacity(0.05),
                offset: const Offset(0, 4),
                blurRadius: 10,
              )
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              removeImg();
            },
            child: SvgPicture.asset(ImageAssets.icRemoveImg),
          ),
        )
      ],
    );
  }

  Widget emptyImage() {
    return GestureDetector(
      onTap: () {
        pickImage();
      },
      child: Container(
        height: 300,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colorDBDFEF.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: color6566E9.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAssets.icImage),
              spaceH10,
              const Text(
                'Tải ảnh lên',
                style: TextStyle(
                  fontSize: 14,
                  color: color667793,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
