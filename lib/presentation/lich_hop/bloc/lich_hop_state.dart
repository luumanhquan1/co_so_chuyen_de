import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:equatable/equatable.dart';

abstract class LichHopState extends Equatable {
  const LichHopState();
}

class LichHopStateIntial extends LichHopState {
  @override
  List<Object?> get props => [];
}

class LichHopStateDangLich extends LichHopState {
  final Type_Choose_Option_List type;

  const LichHopStateDangLich(this.type);

  @override
  List<Object?> get props => [type];
}

class LichHopStateDangList extends LichHopState {
  final Type_Choose_Option_List type;

  const LichHopStateDangList(this.type);

  @override
  List<Object?> get props => [type];
}

class LichHopStateDay extends LichHopState {
  final Type_Choose_Option_Day type;

  const LichHopStateDay(this.type);

  @override
  List<Object?> get props => [type];
}

class LichHopStateWeek extends LichHopState {
  final Type_Choose_Option_Day type;

  const LichHopStateWeek(this.type);

  @override
  List<Object?> get props => [type];
}

class LichHopStateMonth extends LichHopState {
  final Type_Choose_Option_Day type;

  const LichHopStateMonth(this.type);

  @override
  List<Object?> get props => [type];
}
