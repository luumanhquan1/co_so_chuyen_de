import 'dart:typed_data';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/user_model.dart';
import 'package:ccvc_mobile/presentation/home_screen/ui/widget/pick_image_widget.dart';
import 'package:ccvc_mobile/widgets/button/button_custom_bottom.dart';
import 'package:flutter/material.dart';


class CreatePostScreen extends StatefulWidget {
  final UserModel userModel;
  final Function(Uint8List? image, String content) createPost;

  const CreatePostScreen({
    Key? key,
    required this.userModel,
    required this.createPost,
  }) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController textEditingController = TextEditingController();
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: textEditingController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'What is on your mind ?',
                    ),
                  ),
                  spaceH20,
                  PickImageWidget(
                    onChangeImage: (image) {
                      _image = image;
                    },
                  ),
                ],
              ),
            ),
          ),
          spaceH20,
          Row(
            children: [
              Expanded(
                child: ButtonCustomBottom(
                  title: 'Đóng',
                  isColorBlue: true,
                  onPressed: () {
                    Navigator.pop(context, '');
                  },
                ),
              ),
              spaceW15,
              Expanded(
                child: ButtonCustomBottom(
                  title: 'Đăng',
                  isColorBlue: true,
                  onPressed: () {
                    widget.createPost(_image, textEditingController.text);
                    Navigator.pop(context, '');
                  },
                ),
              ),
            ],
          ),
          spaceH10,
        ],
      ),
    );
  }
}
