
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccvc_mobile/utils/extensions/size_extension.dart';
import '/domain/model/account/data_user.dart';
import '/home_module/config/resources/color.dart';
import '/home_module/config/resources/styles.dart';



import '/generated/l10n.dart';
import '/home_module/presentation/home_screen/ui/home_provider.dart';
import '/home_module/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';

class InfoUserWidget extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  const InfoUserWidget({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataUser>(
        stream: HomeProvider.of(context).homeCubit.getUserInformation,
        builder: (context, snapshot) {
          final data = snapshot.data ?? DataUser();
          final result = data.userInformation;
          return Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '${S.current.hello}, ',
                      style: textNormal(
                       textTitle,
                        16.0.textScale(),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: result?.hoTen ?? '',
                          style: titleText(
                            color: textTitle,
                            fontSize: 16.0.textScale(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    result?.chucVu ?? '',
                    style: textNormal(
                      subTitle,
                      14.0.textScale(),
                    ),
                  )
                ],
              ),
              Container(
                height: 40.0.textScale(space: 8),
                width: 40.0.textScale(space: 8),
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: CachedNetworkImage(
                  imageUrl: result?.anhDaiDienFilePath ?? '',
                  errorWidget: (context, url, error) => Container(
                      color: Colors.black,
                      child: Image.asset(ImageAssets.anhDaiDienMacDinh)),
                ),
              )
            ],
          );
        });
  }
}
