import 'package:ccvc_mobile/domain/model/home/pham_vi_model.dart';

abstract class HomeRepository{
  Future<PhamViModel> getPhamVi();
}