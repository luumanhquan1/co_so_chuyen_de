import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/domain/model/document/outgoing_document.dart';
import 'package:ccvc_mobile/presentation/incoming_document/widget/incoming_document_cell.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ListVB extends StatefulWidget {
  final String titleButton;
  final List<OutgoingDocument> list;
  const ListVB({ required this.titleButton,required this.list,Key? key})
      : super(key: key);

  @override
  _ListVBState createState() => _ListVBState();
}

class _ListVBState extends State<ListVB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          buttonChitiet(widget.titleButton),
          const SizedBox(height: 20,),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:widget.list.length,
            itemBuilder: (context, index) {
              return IncomingDocumentCell(
                title: widget.list[index].loaiVanBan,
                dateTime: widget.list[index].ngayBanHanh,
                userName: widget.list[index].nguoiSoanThao,
                status: widget.list[index].doKhan,
                userImage: '',
              );
            },
          ),
        ],

      ),
    );
  }
}
Widget buttonChitiet(String text){
  return Container(
    width: 205,
    height: 40,
    padding: const EdgeInsets.only(left: 20),
    color: textDefault.withOpacity(0.1),
    child: Row(
      children: [
        Text(text,style: textNormalCustom(color: textDefault),),
        const SizedBox(width: 8,),
        SvgPicture.asset(ImageAssets.ic_chitet),
      ],
    ),
  );

}
