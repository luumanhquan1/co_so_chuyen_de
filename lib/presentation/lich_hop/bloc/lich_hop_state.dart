import 'package:ccvc_mobile/presentation/lich_hop/bloc/lich_hop_cubit.dart';
import 'package:equatable/equatable.dart';

abstract class LichHopState extends Equatable {
  const LichHopState(this.type);
  final Type_Choose_Option_Day type;
}

class LichHopStateIntial extends LichHopState {
  const LichHopStateIntial() : super(Type_Choose_Option_Day.DAY);
  @override
  List<Object?> get props => [];
}

class LichHopStateDangLich extends LichHopState {

  const LichHopStateDangLich( Type_Choose_Option_Day type) : super(type);

  @override
  List<Object?> get props => [type];
}

class LichHopStateDangList extends LichHopState {
  const LichHopStateDangList( Type_Choose_Option_Day type) : super(type);

  @override
  List<Object?> get props => [type];
}

class LichHopStateDay extends LichHopState {

  const LichHopStateDay( Type_Choose_Option_Day type) : super(type);

  @override
  List<Object?> get props => [type];
}

class LichHopStateWeek extends LichHopState {

  const LichHopStateWeek( Type_Choose_Option_Day type) : super(type);

  @override
  List<Object?> get props => [type];
}

class LichHopStateMonth extends LichHopState {

  const LichHopStateMonth( Type_Choose_Option_Day type) : super(type);

  @override
  List<Object?> get props => [type];
}
