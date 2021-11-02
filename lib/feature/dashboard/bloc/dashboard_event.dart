import 'package:engage_app/common/constant/env.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DashboardLoadingEvent extends DashboardEvent {
  final Env env;

  DashboardLoadingEvent({@required this.env});
}
