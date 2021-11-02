import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class DashboardState extends Equatable {
  const DashboardState();
  @override
  List<Object> get props => [];
}

class DashboardLoading extends DashboardState {}

class DashboardLoadSuccess extends DashboardState {}

class DashboardLoadFail extends DashboardState {
  final String error;

  DashboardLoadFail({@required this.error});
}
