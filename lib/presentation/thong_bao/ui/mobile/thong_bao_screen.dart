import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/domain/model/thong_bao/thong_bao_model.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/thong_bao/bloc/thong_bao_cubit.dart';
import 'package:ccvc_mobile/presentation/thong_bao/ui/widget/item_thong_bao.dart';
import 'package:ccvc_mobile/widgets/appbar/mobile/base_app_bar_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThongBaoScreen extends StatefulWidget {
  final ThongBaoCubit thongBaoCubit;

  const ThongBaoScreen({Key? key, required this.thongBaoCubit})
      : super(key: key);

  @override
  _ThongBaoScreenState createState() => _ThongBaoScreenState();
}

class _ThongBaoScreenState extends State<ThongBaoScreen> {
  @override
  void initState() {
    super.initState();
    widget.thongBaoCubit.getThongBao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarMobile(
        title: S.current.thong_bao,
        leadingIcon: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: unselectLabelColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: StreamBuilder<List<ThongBaoModel>>(
          stream: widget.thongBaoCubit.thongBaoStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            final data = snapshot?.data ?? [];

            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
              return ItemThongBao(
                  image: data[index].image,
                  title: data[index].title,
                  content: data[index].content,
                  time: data[index].time,
                  status: data[index].status,);
            });
          },
        ),
      ),
    );
  }
}
